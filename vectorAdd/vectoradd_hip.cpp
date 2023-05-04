/*
Copyright (c) 2015-2016 Advanced Micro Devices, Inc. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
#include <assert.h>
#include <stdio.h>
#include <algorithm>
#include <stdlib.h>
#include<iostream>
#include "hip/hip_runtime.h"


#ifdef NDEBUG
#define HIP_ASSERT(x) x
#else
#define HIP_ASSERT(x) (assert((x)==hipSuccess))
#endif


#define WIDTH     1024
#define HEIGHT    1024

#define NUM       (WIDTH*HEIGHT)

#define THREADS_PER_BLOCK_X  256
#define THREADS_PER_BLOCK_Y  1
#define THREADS_PER_BLOCK_Z  1


#define GET_WRITE_DISPATCH_ID \
        ((uint32_t __attribute__((address_space(4)))*)__builtin_amdgcn_queue_ptr())[ \
           10 \
          + 4 \
        ]

#define GET_READ_DISPATCH_ID \
        ((uint32_t __attribute__((address_space(4)))*)__builtin_amdgcn_queue_ptr())[ \
           10 \
          + 4 \
          + 2 \
          + 1 \
          + 1 \
          + 1 \
          + 1 \
          + 2 \
          + 1 \
          + 9 \
        ]

#define GET_BARRIER_BIT \
        ((uint32_t __attribute__((address_space(4)))*)__builtin_amdgcn_dispatch_ptr())[0] >> 8 & 0x1


#if 0
        ((uint32_t __attribute__((address_space(4)))*)__builtin_amdgcn_queue_ptr())[
           10   // hsa_quque
          + 4   // reserved1
          //+ 2   // write_dispatch_id
          //+ 1   // group_segment_aperture_base_hi
          //+ 1   // private_segment_aperture_base_hi
          //+ 1   // max_cu_id
          //+ 1   // max_wave_id
          //+ 2   // max_legacy_doorbell_dispatch_id_plus_1
          //+ 1   // legacy_doorbell_lock
          //+ 9   // reserved2

          //+ 2   // read_dispatch_id
          //+ 1   // read_dispatch_id_field_base_byte_offset
          //+ 1   // compute_tmpring_size
          //+ 4   // scratch_resource_descriptor
          //+ 2   // scratch_backing_memory_location
          //+ 2   // scratch_backing_memory_byte_size
          //+ 1   // scratch_wave64_lane_byte_size
          //+ 1   // queue_properties
          //+ 2   // reserved3
          //+ 2   // queue_inactive_signal
        ] << 16

        |

        ((uint32_t __attribute__((address_space(4)))*)__builtin_amdgcn_queue_ptr())[
           10   // hsa_quque
          + 4   // reserved1
          + 2   // write_dispatch_id
          + 1   // group_segment_aperture_base_hi
          + 1   // private_segment_aperture_base_hi
          + 1   // max_cu_id
          + 1   // max_wave_id
          + 2   // max_legacy_doorbell_dispatch_id_plus_1
          + 1   // legacy_doorbell_lock
          + 9   // reserved2

          //+ 2   // read_dispatch_id
          //+ 1   // read_dispatch_id_field_base_byte_offset
          //+ 1   // compute_tmpring_size
          //+ 4   // scratch_resource_descriptor
          //+ 2   // scratch_backing_memory_location
          //+ 2   // scratch_backing_memory_byte_size
          //+ 1   // scratch_wave64_lane_byte_size
          //+ 1   // queue_properties
          //+ 2   // reserved3
          //+ 2   // queue_inactive_signal
        ];
#endif

__global__ void 
vectoradd_float(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ c) {
  // obtain barrier bit in AQL packet
  uint32_t bb = GET_BARRIER_BIT;
  if (!bb) {
    // fetch read_dispatch_id and write_dispatch_id
    uint32_t w = GET_WRITE_DISPATCH_ID;
    uint32_t r = GET_READ_DISPATCH_ID;
    while (w - r != 1) {
      w = GET_WRITE_DISPATCH_ID;
      r = GET_READ_DISPATCH_ID;
    }
  }
  
  int x = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
  int y = THREADS_PER_BLOCK_Y * hipBlockIdx_y + hipThreadIdx_y;
  int i = y * WIDTH + x;
  c[i] = a[i] + b[i];
}

using namespace std;

int main() {
  
  float* hostA;
  float* hostB;
  float* hostC;

  float* deviceA;
  float* deviceB;
  float* deviceC;

  hipDeviceProp_t devProp;
  hipGetDeviceProperties(&devProp, 0);
  cout << " System minor " << devProp.minor << endl;
  cout << " System major " << devProp.major << endl;
  cout << " agent prop name " << devProp.name << endl;
  cout << "hip Device prop succeeded " << endl ;

  int i;
  int errors;

  hostA = (float*)malloc(NUM * sizeof(float));
  hostB = (float*)malloc(NUM * sizeof(float));
  hostC = (float*)malloc(NUM * sizeof(float));
  
  // initialize the input data
  for (i = 0; i < NUM; i++) {
    hostA[i] = (float)i;
    hostB[i] = (float)i*100.0f;
    hostC[i] = 0.0f;
  }
  
  HIP_ASSERT(hipMalloc((void**)&deviceA, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceB, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceC, NUM * sizeof(float)));
  
  HIP_ASSERT(hipMemcpy(deviceA, hostA, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceB, hostB, NUM*sizeof(float), hipMemcpyHostToDevice));

  for (int i = 0; i < 256; ++i) {
    hipLaunchKernelGGL(vectoradd_float,
                    dim3(WIDTH/THREADS_PER_BLOCK_X, HEIGHT/THREADS_PER_BLOCK_Y),
                    dim3(THREADS_PER_BLOCK_X, THREADS_PER_BLOCK_Y),
                    0, 0,
                    deviceA ,deviceB ,deviceC);
  }
  HIP_ASSERT(hipMemcpy(hostC, deviceC, NUM*sizeof(float), hipMemcpyDeviceToHost));
  printf("c[0]: %08X\n", reinterpret_cast<unsigned int*>(hostC)[0]);

  HIP_ASSERT(hipFree(deviceA));
  HIP_ASSERT(hipFree(deviceB));
  HIP_ASSERT(hipFree(deviceC));

  free(hostA);
  free(hostB);
  free(hostC);

  return errors;
}
