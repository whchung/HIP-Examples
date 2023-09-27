#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <hip/hip_runtime.h>
#include <rccl/rccl.h>
#include <mpi.h>

#ifndef HIP_ASSERT
#define HIP_ASSERT(error)                                                                                              \
  if (error != hipSuccess) {                                                                                           \
    fprintf(stderr, "Hip error: '%s'(%d) at %s:%d\n", hipGetErrorString(error), error, __FILE__, __LINE__);            \
    exit(-1);                                                                                                          \
  }
#endif

#ifndef RCCL_ASSERT
#define RCCL_ASSERT(error)                                                                                             \
  if (error != ncclSuccess) {                                                                                          \
    fprintf(stderr, "RCCL error(Err=%d) at %s:%d\n", error, __FILE__, __LINE__);                                       \
    fprintf(stderr, "\n");                                                                                             \
    exit(-1);                                                                                                          \
  }
#endif

#define WIDTH 128
#define HEIGHT 128
#define SIZE (WIDTH*HEIGHT)
#define BLOCK_SIZE 256 // Also known has WG size (# of threads per WG)
#define WARMUP_ROUNDS 6
#define EPOCHS 10
#define DEBUG 0

using namespace std;

__global__ void vecAdd(const float* __restrict__ d_A, const float* __restrict__ d_B, float* __restrict__ d_C, int size) 
{
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < size) 
  {
    d_C[idx] = d_A[idx] + d_B[idx];
  }
}

void vecAddCPU(const float* __restrict__ h_A, const float* __restrict__ h_B, float* __restrict__ h_C_CPU) 
{
  for (int i = 0; i < SIZE; i++) 
  {
    h_C_CPU[i] = h_A[i] + h_B[i];
  }
}

bool compareResults(const float* __restrict__ h_C_GPU, const float* __restrict__ h_C_CPU, int world_size) 
{
  for(int i = 0; i < SIZE; i++) 
  {
    float tmp = h_C_CPU[i] * world_size;
    // printf("%f", tmp);
    if (tmp != h_C_GPU[i]) {
      return false;
    }
  }
  return true;
}

void retrieveHardwareProperties(int device_id) 
{
  printf("\n----------- Device Properties -----------\n");
  hipDeviceProp_t deviceProperties;
  hipGetDeviceProperties(&deviceProperties, device_id);
  cout << "System minor - " << deviceProperties.minor << endl;
  cout << "System major - " << deviceProperties.major << endl;
  cout << "Agent name - " << deviceProperties.name << endl;
}

void initializeHostArrays(float* h_A, float* h_B, float* h_C, float* h_C_CPU, int comm_rank) 
{
#if DEBUG
  printf("\n----------- MPI GPU ID - %d - Initializing Host Arrays -----------\n", comm_rank);
#endif
  for(int i = 0; i < SIZE; i++) 
  {
    h_A[i] = ((float)i*(float)i) + 0.01;
    h_B[i] = (float)i + 0.05;
    h_C[i] = (float)0.0f;
    h_C_CPU[i] = (float)0.0f;
  }
}

void showHostArrays(float* h_A, float* h_B, float* h_C, float* h_C_CPU, int comm_rank, int limit) 
{
  // Note: limit is <= SIZE used for debugging purposes 
  printf("\n----------- MPI GPU ID - %d - Show Host Arrays -----------\n", comm_rank);

  printf("h_A[%d] -> ", limit);
  for(int i = 0; i < limit; i++) 
  {
    cout << h_A[i] << ", ";
  }

  printf("\n");

  printf("h_B[%d] -> ", limit);
  for(int i = 0; i < limit; i++) 
  {
    cout << h_B[i] << ", ";
  }

  printf("\n");

  printf("h_C[%d] -> ", limit);
  for(int i = 0; i < limit; i++) 
  {
    cout << h_C[i] << ", ";
  }

  printf("\n");
  
  printf("h_C_CPU[%d] -> ", limit);
  for(int i = 0; i < limit; i++) 
  {
    cout << h_C_CPU[i] << ", ";
  }
}

// void showComparison(const float* __restrict__ h_C, const float* __restrict__ h_C_CPU, int comm_rank, int limit) {
//   // Note: limit is <= SIZE used for debugging purposes 
//   printf("\n----------- MPI GPU ID - %d - Comparing h_C[%d] & h_C_CPU[%d] -----------\n", comm_rank, limit, limit);
  
//   printf("h_C[%d] -> ", limit);
//   for(int i = 0; i < limit; i++) 
//   {
//     cout << h_C[i] << ", ";
//   }

//   printf("\n");

//   printf("h_C_CPU[%d] -> ", limit);
//   for(int i = 0; i < limit; i++) 
//   {
//     cout << h_C_CPU[i] << ", ";
//   }
// }

void showRuntimeStats(vector<hipEvent_t> start, vector<hipEvent_t> end, int rank) 
{
  printf("----------- MPI GPU ID - %d - Per Epoch Runtime (ms) -----------\n", rank);
  for (int i = 0; i < start.size(); i++) 
  {
    printf("EPOCH - %d -> ", i + 1);
    float duration = 0.0f;
    HIP_ASSERT(hipEventElapsedTime(&duration, start[i], end[i]));
    printf("%f\n", duration);
  }
}

int main(int argc, char* argv[]) 
{

  // Init MPI
  int comm_rank, comm_size;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &comm_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &comm_size);
#if DEBUG
  printf("\n----------- MPI Settings -----------\n");
  printf("*** MPI comm rank - %d, MPI world size - %d ***\n", comm_rank, comm_size);
#endif

  ncclUniqueId nccl_unique_id;
  if (comm_rank == 0) 
  {
    RCCL_ASSERT(ncclGetUniqueId(&nccl_unique_id)); // get rccl id for comm rank 0 (which is root GPU process)
  }
  MPI_Bcast(&nccl_unique_id, sizeof(nccl_unique_id), MPI_BYTE, 0, MPI_COMM_WORLD);
#if DEBUG
  printf("\n----------- MPI Broadcast -----------\n");
  printf("*** MPI GPU ID - %d -> called MPI_Bcast() ***\n", comm_rank);
#endif

  HIP_ASSERT(hipSetDevice(comm_rank)); // set current hipDevice for buffer allocation and RCCL init

  // Allocate RCCL buffers
  // float* send_buff;
  // float* recv_buff;
  // HIP_ASSERT(hipMalloc((void**)&send_buff, SIZE * sizeof(float)));
  // HIP_ASSERT(hipMalloc((void**)&recv_buff, SIZE * sizeof(float)));
// #if DEBUG
//   printf("\n----------- RCCL Buffer Allocation -----------\n");
//   printf("*** MPI GPU rank - %d -> allocated send & recv buffers\n", comm_rank);
// #endif

  // Init RCCL
  ncclComm_t nccl_comm;
  RCCL_ASSERT(ncclCommInitRank(&nccl_comm, comm_size, nccl_unique_id, comm_rank));
#if DEBUG
  printf("\n----------- Init RCCL -----------\n");
  printf("*** MPI GPU rank - %d -> called ncclCommInitRank()\n", comm_rank);
#endif

  // Probe device properties
#if DEBUG
  if (comm_rank == 0) 
  {
    retrieveHardwareProperties(comm_rank);
  }
#endif

  // Allocate host & device memory
  float* h_A = (float*)malloc(SIZE * sizeof(float));
  float* h_B = (float*)malloc(SIZE * sizeof(float));
  float* h_C = (float*)malloc(SIZE * sizeof(float));
  float* h_C_CPU = (float*)malloc(SIZE * sizeof(float));
  float* d_A;
  float* d_B;
  float* d_C;
  HIP_ASSERT(hipMalloc((void**)&d_A, SIZE * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&d_B, SIZE * sizeof(float)));
  HIP_ASSERT(hipMalloc((void**)&d_C, SIZE * sizeof(float)));
#if DEBUG
  printf("\n----------- MPI Host & Device Memory Allocation -----------\n");
  printf("*** MPI GPU ID - %d -> called malloc() & hipMalloc() ***\n", comm_rank);
#endif

  // Initialize host values
  initializeHostArrays(h_A, h_B, h_C, h_C_CPU, comm_rank);

  // Show host values
#if DEBUG
  showHostArrays(h_A, h_B, h_C, h_C_CPU, comm_rank, 20);
#endif
  
  // Copy from host to device
  HIP_ASSERT(hipMemcpy(d_A, h_A, SIZE * sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(d_B, h_B, SIZE * sizeof(float), hipMemcpyHostToDevice));
  HIP_ASSERT(hipMemcpy(d_C, h_C, SIZE * sizeof(float), hipMemcpyHostToDevice));

  // Do kernel grid/block size calculations
  dim3 grid_size;
  dim3 block_size = {BLOCK_SIZE, 1, 1}; // no threads in y or z dim blocks
#if DEBUG
    printf("\n----------- MPI GPU ID - %d - Allocated WG Dim - %d -----------\n", comm_rank, BLOCK_SIZE);
#endif
  if (SIZE % BLOCK_SIZE == 0) 
  {
    // you can also put grid_size = {2} -> will tell compiler to automatically fill 1s in y and z since its 1 dim
    grid_size = {(SIZE/BLOCK_SIZE), 1, 1}; // no thread blocks in the y or z dim grid
#if DEBUG
    printf("\n----------- MPI GPU ID - %d - Allocated Grid Dim - %d -----------\n", comm_rank, (SIZE/BLOCK_SIZE));
#endif
  } 
  else 
  {
    grid_size = {(SIZE/BLOCK_SIZE) + 1, 1, 1}; // no thread blocks in the y or z dim grid
#if DEBUG
    printf("\n----------- MPI GPU ID - %d - Allocated Grid Dim - %d -----------\n", comm_rank, (SIZE/BLOCK_SIZE) + 1);
#endif
  }
  
  // Warmup
  for(int j = 0; j < WARMUP_ROUNDS; j++)
  {
#if DEBUG
    printf("\n----------- MPI GPU ID - %d -  Warmup Round - %d -----------\n", comm_rank, j + 1);
    printf("*** Calling vecAdd<<<>>> kernel ***\n");
#endif
    vecAdd<<<grid_size, block_size, 0, 0>>>(d_A, d_B, d_C, SIZE);
    // vecAdd<<<dim3(SIZE/BLOCK_SIZE), dim3(BLOCK_SIZE), 0, 0>>>(d_A, d_B, d_C, SIZE);
#if DEBUG
    printf("*** Calling ncclAllReduce() ***\n");
#endif
    ncclGroupStart();
    // AllReduce operation happening in-place as send_buff == recv_buff
    RCCL_ASSERT(ncclAllReduce((const void*)d_C, (void*)d_C, SIZE, ncclFloat32, ncclSum, nccl_comm, NULL)); 
    ncclGroupEnd();
  }

  // Reset d_C
  HIP_ASSERT(hipMemset((void*)d_C, 0.0f, SIZE * sizeof(float)));
#if DEBUG
  printf("\n----------- MPI GPU ID - %d - Memset d_C -----------\n", comm_rank);
#endif

  // Create HIP Events vectors to track start & stop for each epoch
  vector<hipEvent_t> track_start;
  vector<hipEvent_t> track_end;

  // Do Vector Add + Allreduce
  for(int i = 0; i < EPOCHS; i++) 
  {
    usleep(500);
    hipEvent_t start_event, stop_event;
    HIP_ASSERT(hipEventCreate(&start_event));
    HIP_ASSERT(hipEventCreate(&stop_event));
    HIP_ASSERT(hipEventRecord(start_event, nullptr));
    track_start.push_back(start_event);
    MPI_Barrier(MPI_COMM_WORLD); // makes sure no two MPI processes are entering below block of code at same time

    for(int j  = 0; j < WARMUP_ROUNDS; j++) 
    {
      vecAdd<<<grid_size, block_size, 0, 0>>>(d_A, d_B, d_C, SIZE);
      // vecAdd<<<dim3(SIZE/BLOCK_SIZE), dim3(BLOCK_SIZE), 0, 0>>>(d_A, d_B, d_C, SIZE);
      ncclGroupStart();
      // AllReduce operation happening in-place as send_buff == recv_buff
      RCCL_ASSERT(ncclAllReduce((const void*)d_C, (void*)d_C, SIZE, ncclFloat32, ncclSum, nccl_comm, NULL)); 
      ncclGroupEnd();
    }
    HIP_ASSERT(hipEventRecord(stop_event, nullptr));
    HIP_ASSERT(hipEventSynchronize(stop_event));
    track_end.push_back(stop_event);
  }

  // Copy from device to host
  HIP_ASSERT(hipMemcpy(h_C, d_C, SIZE * sizeof(float), hipMemcpyDeviceToHost));

  // Finalize RCCL
#if DEBUG
  printf("\n----------- MPI RCCL Tear Down -----------\n");
  printf("*** MPI GPU ID - %d -> initiated ncclCommDestroy() ***\n", comm_rank);
#endif
  RCCL_ASSERT(ncclCommDestroy(nccl_comm));

  // Finalize MPI
#if DEBUG
  printf("\n----------- MPI Tear Down -----------\n");
  printf("*** MPI GPU ID - %d -> initiated MPI_Finalize() ***\n", comm_rank);
#endif
  MPI_Finalize();

  // CPU verify h_C calculated from GPU Allreduce
  vecAddCPU(h_A, h_B, h_C_CPU);
  if (compareResults(h_C, h_C_CPU, comm_size)) 
  {
    printf("------------ MPI GPU ID - %d VecAdd & RCCL Allreduce Success! -----------\n", comm_rank);
  }
  else 
  {
    printf("------------ MPI GPU ID - %d VecAdd & RCCL Allreduce Failed! -----------\n", comm_rank);
  }

  // Show execution time for rank 0 or 1 or any other rank if using more than 2 MPI GPU processes
  if (comm_rank == 0) {
    showRuntimeStats(track_start, track_end, comm_rank);
  }

  // MPI memory deallocation
  HIP_ASSERT(hipFree(d_A));
  HIP_ASSERT(hipFree(d_B));
  HIP_ASSERT(hipFree(d_C));
  // HIP_ASSERT(hipFree(send_buff));
  // HIP_ASSERT(hipFree(recv_buff));
  free(h_A);
  free(h_B);
  free(h_C);
#if DEBUG
  printf("\n----------- MPI Memory Deallocation -----------\n");
  printf("*** MPI GPU ID - %d -> initiated free() & hipFree() for host, device, & RCCL buffers ***\n", comm_rank);
#endif

  return 0;
}