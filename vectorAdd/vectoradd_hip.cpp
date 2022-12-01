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


#define WIDTH     64
#define HEIGHT    1

#define NUM       (WIDTH*HEIGHT)

#define THREADS_PER_BLOCK_X  64
#define THREADS_PER_BLOCK_Y  1
#define THREADS_PER_BLOCK_Z  1

__global__ void 
vectorset_float(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ c)

  {
 
      int x = hipThreadIdx_x;
      int y = hipThreadIdx_y;

      int i = y * WIDTH + x;
      if (i < 32) {
        c[i] = a[i] + b[i];
      } else {
        c[i] = (a[i] + b[i]) * 2;
      }



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
  }
  
  HIP_ASSERT(hipMalloc((void**)&deviceA, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceB, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceC, NUM * sizeof(float)));
  
  HIP_ASSERT(hipMemcpy(deviceA, hostA, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceB, hostB, NUM*sizeof(float), hipMemcpyHostToDevice));


  hipLaunchKernelGGL(vectorset_float, 
                  dim3(WIDTH/THREADS_PER_BLOCK_X, HEIGHT/THREADS_PER_BLOCK_Y),
                  dim3(THREADS_PER_BLOCK_X, THREADS_PER_BLOCK_Y),
                  0, 0,
                  //deviceA ,deviceB ,deviceC ,WIDTH ,HEIGHT);
                  deviceA ,deviceB ,deviceC);


  HIP_ASSERT(hipMemcpy(hostC, deviceC, NUM*sizeof(float), hipMemcpyDeviceToHost));

  // verify the results
  errors = 0;
  for (i = 0; i < NUM; i++) {
    if (i < 32) {
      std::cout << hostA[i] << " " << hostB[i] << " " << hostC[i] << "\n";
    } else {
      std::cout << hostA[i] << " " << hostB[i] << " " << reinterpret_cast<unsigned int*>(hostC)[i] << "\n";
    }
#if 0
    if (i < 32) {
      if (hostC[i] != (hostA[i] + hostB[i])) {
        errors++;
      }
    } else {
      if (hostC[i] != ((hostA[i] + hostB[i]) * 2)) {
        errors++;
      }
    }
#endif
  }
#if 0
  if (errors!=0) {
    printf("FAILED: %d errors\n",errors);
  } else {
      printf ("PASSED!\n");
  }
#endif

  HIP_ASSERT(hipFree(deviceA));
  HIP_ASSERT(hipFree(deviceB));
  HIP_ASSERT(hipFree(deviceC));

  free(hostA);
  free(hostB);
  free(hostC);

  //hipResetDefaultAccelerator();

  return errors;
}
