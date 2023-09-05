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

#include <mpi.h>
#include <rccl.h>
#include <unistd.h>

#ifndef FUSED
#define FUSED (0)
#endif

#define NDEBUG
#ifdef NDEBUG
#define HIP_ASSERT(x) x
#else
#define HIP_ASSERT(x) (assert((x)==hipSuccess))
#endif


#define WIDTH     (288)
#define HEIGHT    256

#define NUM       (WIDTH*HEIGHT)
#define WARMUP    (4)
#define ROUNDS    (64)
#define OUTER_ROUNDS (1)

#define THREADS_PER_BLOCK_X  256

__global__ void 
kernel1(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ c, int* semaphore
                )

  {
      int i = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
      c[i] = a[i] + b[i];
  }

__global__ void
kernel2(const float* __restrict__ c, float* __restrict__ d)

  {
      int i = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
      d[i] = c[i] * 3;
  }

using namespace std;

ncclComm_t nccl_comm;

int main() {
 
  // Init MPI
  int comm_rank, comm_size;
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &comm_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &comm_size);
  printf("rank %d, size %d\n", comm_rank, comm_size);

  // Init RCCL
  ncclUniqueId nccl_id;
  if (comm_rank == 0) {
    ncclGetUniqueId(&nccl_id);
  }
  MPI_Bcast(&nccl_id, sizeof(ncclUniqueId), MPI_BYTE, 0, MPI_COMM_WORLD);
  hipSetDevice(comm_rank);
  ncclCommInitRank(&nccl_comm, comm_size, nccl_id, comm_rank);

  float* hostA;
  float* hostB;
  float* hostC;
  float* hostD;
  int* hostSema;

  float* deviceA;
  float* deviceB;
  float* deviceC;
  float* deviceD;
  int* deviceSema;

  hipDeviceProp_t devProp;
  hipGetDeviceProperties(&devProp, 0);
  cout << " System minor " << devProp.minor << endl;
  cout << " System major " << devProp.major << endl;
  cout << " agent prop name " << devProp.name << endl;



  cout << "hip Device prop succeeded " << endl ;


  int i;
  int errors;

  hipEvent_t startEvent, stopEvent;
  HIP_ASSERT(hipEventCreate(&startEvent));
  HIP_ASSERT(hipEventCreate(&stopEvent));

  hostA = (float*)malloc(NUM * sizeof(float));
  hostB = (float*)malloc(NUM * sizeof(float));
  hostC = (float*)malloc(NUM * sizeof(float));
  hostD = (float*)malloc(NUM * sizeof(float));
  hostSema = (int*)malloc(1 * sizeof(int));
  
  // initialize the input data
  for (i = 0; i < NUM; i++) {
    hostA[i] = (float)i;
    hostB[i] = (float)i*100.0f;
    hostC[i] = (float)0.0f;
    hostD[i] = (float)0.0f;
  }
  *hostSema = 0;
  
  HIP_ASSERT(hipMalloc((void**)&deviceA, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceB, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceC, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceD, NUM * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&deviceSema, 1 * sizeof(int)));
  
  HIP_ASSERT(hipMemcpy(deviceA, hostA, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceB, hostB, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceSema, hostSema, 1*sizeof(int), hipMemcpyHostToDevice));

  // Inititalize data for all reduce.
  const int all_reduce_size = 5120;
  const int type_size = 4; // float32
  void *send_buffer, *recv_buffer;
  hipMalloc(&send_buffer, all_reduce_size * type_size);
  hipMalloc(&recv_buffer, all_reduce_size * type_size);

  // warm-up
  for (i = 0; i < WARMUP; ++i) {
    hipLaunchKernelGGL(kernel1,
                    dim3(WIDTH*HEIGHT/THREADS_PER_BLOCK_X),
                    dim3(THREADS_PER_BLOCK_X),
                    0, 0,
                    deviceA ,deviceB ,deviceC, deviceSema
                    );

    ncclGroupStart();
    ncclAllReduce(send_buffer, send_buffer, all_reduce_size, ncclFloat32, ncclSum, nccl_comm, NULL);
    ncclGroupEnd();
#if 0
    hipLaunchKernelGGL(kernel2,
                    dim3(WIDTH*HEIGHT/THREADS_PER_BLOCK_X),
                    dim3(THREADS_PER_BLOCK_X),
                    0, 0,
                    deviceC ,deviceD);
#endif

#if 0
    HIP_ASSERT(hipMemcpy(deviceSema, hostSema, 1*sizeof(int), hipMemcpyHostToDevice));
#endif
  }
#if 0
  HIP_ASSERT(hipMemcpy(deviceC, hostC, NUM*sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(deviceD, hostD, NUM*sizeof(float), hipMemcpyHostToDevice));
#endif

#if 0
    HIP_ASSERT(hipMemcpy(deviceSema, hostSema, 1*sizeof(int), hipMemcpyHostToDevice));
#endif
  for (int outer_iter = 0; outer_iter < OUTER_ROUNDS; ++outer_iter) {
    usleep(500);
    HIP_ASSERT(hipEventRecord(startEvent, nullptr));
 
    MPI_Barrier(MPI_COMM_WORLD);
    for (i = 0; i < ROUNDS; ++i) {
      hipLaunchKernelGGL(kernel1, 
                      dim3(WIDTH*HEIGHT/THREADS_PER_BLOCK_X),
                      dim3(THREADS_PER_BLOCK_X),
                      0, 0,
                      deviceA ,deviceB ,deviceC, deviceSema
                      );
 
      ncclGroupStart();
      ncclAllReduce(send_buffer, send_buffer, all_reduce_size, ncclFloat32, ncclSum, nccl_comm, NULL);
      ncclGroupEnd();
#if 0
      // kernel2 will be fused with vectoradd_float
      hipLaunchKernelGGL(kernel2, 
                      dim3(WIDTH*HEIGHT/THREADS_PER_BLOCK_X),
                      dim3(THREADS_PER_BLOCK_X),
                      0, 0,
                      deviceC ,deviceD);
#endif
    }

    HIP_ASSERT(hipEventRecord(stopEvent, nullptr));
    HIP_ASSERT(hipEventSynchronize(stopEvent));

    HIP_ASSERT(hipMemcpy(hostC, deviceC, NUM*sizeof(float), hipMemcpyDeviceToHost));
    HIP_ASSERT(hipMemcpy(hostD, deviceD, NUM*sizeof(float), hipMemcpyDeviceToHost));

#if 0 && FUSED
#define EXPECTED_WG (32)
    int wg = 0;
    int expected_result = NUM/THREADS_PER_BLOCK_X;
    if (comm_rank == 1) {
      for (i = 0; i < NUM; i+=THREADS_PER_BLOCK_X) {
	  if (i < THREADS_PER_BLOCK_X * EXPECTED_WG) {
              printf("A: %6.3f, B: %6.3f, C: %6.3f, (int)C: %d\n", hostA[i], hostB[i], hostC[i], reinterpret_cast<int*>(hostC)[i]);
              if (reinterpret_cast<int*>(hostC)[i] >= expected_result) {
                ++wg;
              }
	  }
      }
      printf("WG Passing: %d / %d\n", wg, EXPECTED_WG);
    }
#endif
  } // outer_iter

  // verify the results
  errors = 0;
  for (i = 0; i < NUM; i++) {
    if (hostC[i] != hostA[i] + hostB[i]) {
      errors++;
    }
  }

#if 1
  float ms = 0.0f;
  HIP_ASSERT(hipEventElapsedTime(&ms, startEvent, stopEvent));
  if (comm_rank == 1) {
    printf("Total time: %6.3f ms\n", ms);
    printf("Per-round time: %6.3f us\n", ms / ROUNDS * 1000.0f);
  }
#endif

#if 0
  if (errors!=0) {
    printf("FAILED: %d errors\n",errors);
  } else {
      printf ("PASSED!\n");
  }
#endif

  HIP_ASSERT(hipEventDestroy(startEvent));
  HIP_ASSERT(hipEventDestroy(stopEvent));

  HIP_ASSERT(hipFree(deviceA));
  HIP_ASSERT(hipFree(deviceB));
  HIP_ASSERT(hipFree(deviceC));
  HIP_ASSERT(hipFree(deviceD));

  free(hostA);
  free(hostB);
  free(hostC);
  free(hostD);

  hipFree(send_buffer);
  hipFree(recv_buffer);

  //hipResetDefaultAccelerator();

  ncclCommDestroy(nccl_comm);

#if 0
  return errors;
#endif
  return 0;
}
