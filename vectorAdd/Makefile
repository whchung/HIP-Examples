HIP_PATH?= $(wildcard /opt/rocm/hip)
ifeq (,$(HIP_PATH))
	HIP_PATH=/opt/rocm
endif

HIPCC=$(HIP_PATH)/bin/hipcc
HIP_LIBRARY=/home/jack/projects/hipamd/build/lib/libamdhip64.so
RCCL_LIBRARY=/home/jack/projects/rccl/build/librccl.so

FILENAME = vectoradd_hip
SOURCES = $(FILENAME).cpp
OBJECTS = $(SOURCES:.cpp=.o)
GFXARCH = $(shell rocm_agent_enumerator | tail -1)

EXECUTABLE=./$(FILENAME).exe

.PHONY: test


all: $(EXECUTABLE) test

CXXFLAGS =-O3 -save-temps -I/usr/include/x86_64-linux-gnu/mpich

CXX=$(HIPCC)


$(EXECUTABLE): $(OBJECTS) 
	$(HIPCC) $(OBJECTS) -o $@ -lmpich -L~/projects/rccl/build -lrccl

fuse: $(EXECUTABLE) test
	@echo "\n==== Kernel Fusion ====\n"
	#./fuser.py $(FILENAME)-hip-amdgcn-amd-amdhsa-$(GFXARCH).s > fused.s
	./assemble.sh
	mpirun.mpich -np 2 -env AMD_KERNEL_FUSION=1 -env AMD_KERNEL_FUSION_HOST=_Z7kernel1PKfS0_PfPi -env AMD_KERNEL_FUSION_GUEST=_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork -env ROC_USE_FGS_KERNARG=0 -env LD_PRELOAD=$(HIP_LIBRARY):$(RCCL_LIBRARY) ./fused.exe
	@mpirun.mpich -np 2 -env AMD_LOG_LEVEL=4 -env AMD_KERNEL_FUSION=1 -env AMD_KERNEL_FUSION_HOST=_Z7kernel1PKfS0_PfPi -env AMD_KERNEL_FUSION_GUEST=_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork -env ROC_USE_FGS_KERNARG=0 -env LD_PRELOAD=$(HIP_LIBRARY):$(RCCL_LIBRARY) ./fused.exe 1>/dev/null 2>run_fused.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run_fused.log | wc -l`"
	@rm -f run_fused.log

test: $(EXECUTABLE)
	@echo "\n==== Back-to-back Kernels  ====\n"
	mpirun.mpich -np 2 -env ROC_USE_FGS_KERNARG=0 $(EXECUTABLE)
	@mpirun.mpich -np 2 -env AMD_LOG_LEVEL=4 -env ROC_USE_FGS_KERNARG=0 $(EXECUTABLE) 1>/dev/null 2>run.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run.log | wc -l`"
	@rm -f run.log

clean:
	@rm -f $(EXECUTABLE)
	@rm -f $(OBJECTS)
	@rm -f *.o *.co
	@rm -f $(FILENAME)-*
	@rm -f $(SOURCES)-*
	@rm -f fused_manifest.txt fused.exe
	@rm -rf __pycache__
