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

#define THREADS_PER_BLOCK_X  16
#define THREADS_PER_BLOCK_Y  16
#define THREADS_PER_BLOCK_Z  1

__global__ void 
vectoradd_float(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ c, float* __restrict__ d)

  {
 
      int x = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
      int y = THREADS_PER_BLOCK_Y * hipBlockIdx_y + hipThreadIdx_y;

      int i = y * WIDTH + x;
      if ( i < (WIDTH * HEIGHT)) {
        c[i] = a[i] + b[i];
      }



  }

__global__ void
vectoradd_float2(const float* __restrict__ a, const float* __restrict__ b, const float* __restrict__ c, float* __restrict__ d)

  {

      int x = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
      int y = THREADS_PER_BLOCK_Y * hipBlockIdx_y + hipThreadIdx_y;

      int i = y * WIDTH + x;
      if ( i < (WIDTH * HEIGHT)) {
        d[i] = b[i] + c[i];
      }

  }

using namespace std;

int main() {
  
  float* hostA;
  float* hostB;
  float* hostC;
  float* hostD;

  float* deviceA;
  float* deviceB;
  float* deviceC;
  float* deviceD;

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
  hostD = (float*)malloc(NUM * sizeof(float));
  
  // initialize the input data
  for (i = 0; i < NUM; i++) {
    hostA[i] = (float)i;
    hostB[i] = (float)i*100.0f;
    hostC[i] = (float)0.0f;
    hostD[i] = (float)0.0f;
  }
  
  HIP_ASSERT(hipMalloc((void**)&deviceA, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceB, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceC, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceD, NUM * sizeof(float)));
  
  HIP_ASSERT(hipMemcpy(deviceA, hostA, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceB, hostB, NUM*sizeof(float), hipMemcpyHostToDevice));


  hipLaunchKernelGGL(vectoradd_float, 
                  dim3(WIDTH/THREADS_PER_BLOCK_X, HEIGHT/THREADS_PER_BLOCK_Y),
                  dim3(THREADS_PER_BLOCK_X, THREADS_PER_BLOCK_Y),
                  0, 0,
                  deviceA ,deviceB ,deviceC ,deviceD);

#if 0
  // vectoradd_float2 will be fused with vectoradd_float
  hipLaunchKernelGGL(vectoradd_float2, 
                  dim3(WIDTH/THREADS_PER_BLOCK_X, HEIGHT/THREADS_PER_BLOCK_Y),
                  dim3(THREADS_PER_BLOCK_X, THREADS_PER_BLOCK_Y),
                  0, 0,
                  deviceA ,deviceB ,deviceC ,deviceD);
#endif

  HIP_ASSERT(hipMemcpy(hostD, deviceD, NUM*sizeof(float), hipMemcpyDeviceToHost));

  // verify the results
  errors = 0;
  for (i = 0; i < NUM; i++) {
    if (hostD[i] != (hostA[i] + hostB[i] + hostB[i])) {
      errors++;
    }
  }
  if (errors!=0) {
    printf("FAILED: %d errors\n",errors);
  } else {
      printf ("PASSED!\n");
  }

  HIP_ASSERT(hipFree(deviceA));
  HIP_ASSERT(hipFree(deviceB));
  HIP_ASSERT(hipFree(deviceC));
  HIP_ASSERT(hipFree(deviceD));

  free(hostA);
  free(hostB);
  free(hostC);
  free(hostD);

  //hipResetDefaultAccelerator();

  return errors;
}
