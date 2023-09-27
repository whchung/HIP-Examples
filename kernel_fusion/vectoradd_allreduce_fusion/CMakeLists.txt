cmake_minimum_required(VERSION 3.16)

set(CMAKE_PREFIX_PATH /opt/rocm-5.7.1/lib/cmake) # this needs to be set if find_package() is going to work with rocm packages
project(VecAdd_Allreduce LANGUAGES CXX)


#HINTS /opt/rocm-5.6.0/lib
# include_directories(/usr/lib/x86_64-linux-gnu/openmpi/include) # needed to include mpi.h search path outside of rocm packages

find_package(rccl REQUIRED)
find_package(hip REQUIRED)


# set(MPI_INCLUDE_PATH /usr/lib/x86_64-linux-gnu/openmpi/include) # found on rocm5.6
# set(MPI_CXX_LIB_PATH /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so) # found on rocm5.6

set(MPI_INCLUDE_PATH /usr/mpi/gcc/openmpi-4.1.2a1/include) # in dev container in rocm5.7
set(MPI_CXX_LIB_PATH /usr/mpi/gcc/openmpi-4.1.2a1/lib/libmpi.so) # in dev container in rocm5.7
include_directories(${MPI_INCLUDE_PATH})

add_executable(VaddAR vdd_allreduce.cpp)
target_link_libraries(VaddAR PRIVATE ${MPI_CXX_LIB_PATH} rccl hip::device hip::host)

