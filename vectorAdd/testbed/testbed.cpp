#include <iostream>
#include <pthread.h>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <unistd.h> // usleep
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

// The number of threads to be created.
const int NUM_THREADS = 2;

const int TEST_ITERATIONS = 128;

float* hostA;
float* hostB;
float* hostC;

float* deviceA[NUM_THREADS];
float* deviceB[NUM_THREADS];
float* deviceC[NUM_THREADS];

std::mutex mtx;
std::condition_variable cv;
int threads_ready = 0;

__global__ void
vectoradd_float(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ c) {
    int x = THREADS_PER_BLOCK_X * hipBlockIdx_x + hipThreadIdx_x;
    int y = THREADS_PER_BLOCK_Y * hipBlockIdx_y + hipThreadIdx_y;

    int i = y * WIDTH + x;
    c[i] = a[i] + b[i];
}

void switchToDevice(int deviceId) {
    int currentDeviceId = -1;
    hipSetDevice(deviceId);
    do {
      usleep(10);
      HIP_ASSERT(hipGetDevice(&currentDeviceId));
    } while (deviceId != currentDeviceId);
}

void* userFunction(void* arg) {
    int deviceId = static_cast<int>(reinterpret_cast<unsigned long>(arg));
    switchToDevice(deviceId);

    std::unique_lock<std::mutex> lock(mtx);
    threads_ready++;
    cv.wait(lock, [] { return threads_ready == NUM_THREADS; });

    for (int i = 0; i < TEST_ITERATIONS; ++i) {
      hipLaunchKernelGGL(vectoradd_float, dim3(WIDTH/THREADS_PER_BLOCK_X, HEIGHT/THREADS_PER_BLOCK_Y), dim3(THREADS_PER_BLOCK_X, THREADS_PER_BLOCK_Y), 0, 0, deviceA[deviceId], deviceB[deviceId], deviceC[deviceId]);
    }

    lock.unlock();
    cv.notify_all();
    return nullptr;
}

int main() {

    hipDeviceProp_t devProp;
    hipGetDeviceProperties(&devProp, 0);
    std::cout << " System minor " << devProp.minor << std::endl;
    std::cout << " System major " << devProp.major << std::endl;
    std::cout << " agent prop name " << devProp.name << std::endl;
    std::cout << "hip Device prop succeeded " << std::endl ;

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

    for (i = 0; i < NUM_THREADS; ++i) {
      switchToDevice(i);

      HIP_ASSERT(hipMalloc((void**)&deviceA[i], NUM * sizeof(float)));
      HIP_ASSERT(hipMalloc((void**)&deviceB[i], NUM * sizeof(float)));
      HIP_ASSERT(hipMalloc((void**)&deviceC[i], NUM * sizeof(float)));

      HIP_ASSERT(hipMemcpy(deviceA[i], hostA, NUM*sizeof(float), hipMemcpyHostToDevice));
      HIP_ASSERT(hipMemcpy(deviceB[i], hostB, NUM*sizeof(float), hipMemcpyHostToDevice));
    }

    std::vector<pthread_t> threads(NUM_THREADS);

    // Create the threads.
    for (i = 0; i < NUM_THREADS; ++i) {
        if (pthread_create(&threads[i], nullptr, userFunction, reinterpret_cast<void*>(i)) != 0) {
            std::cerr << "Error: Unable to create thread " << i << std::endl;
            return 1;
        }
    }

    // Wait for all threads to complete.
    for (i = 0; i < NUM_THREADS; ++i) {
        if (pthread_join(threads[i], nullptr) != 0) {
            std::cerr << "Error: Unable to join thread " << i << std::endl;
            return 2;
        }
    }

    //std::cout << "All threads have completed successfully." << std::endl;

    switchToDevice(NUM_THREADS - 1);
    HIP_ASSERT(hipMemcpy(hostC, deviceC[NUM_THREADS - 1], NUM*sizeof(float), hipMemcpyDeviceToHost));

    // verify the results
    errors = 0;
    for (i = 0; i < NUM; i++) {
      if (hostC[i] != (hostA[i] + hostB[i])) {
        errors++;
      }
    }
    if (errors != 0) {
      std::cout << "FAILED: " << errors << " errors\n";
    } else {
      std::cout << "PASSED!\n";
    }

    for (i = 0; i < NUM_THREADS; ++i) {
      switchToDevice(i);
      HIP_ASSERT(hipFree(deviceA[i]));
      HIP_ASSERT(hipFree(deviceB[i]));
      HIP_ASSERT(hipFree(deviceC[i]));
    }

    free(hostA);
    free(hostB);
    free(hostC);

    return errors;
}

