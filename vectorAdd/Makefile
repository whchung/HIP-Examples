HIP_PATH?= $(wildcard /opt/rocm/hip)
ifeq (,$(HIP_PATH))
	HIP_PATH=/opt/rocm
endif

HIPCC=$(HIP_PATH)/bin/hipcc
HIP_LIBRARY=/home/whchung/projects/clr/build/hipamd/lib/libamdhip64.so
RCCL_LIBRARY=/home/whchung/projects/rccl/build/librccl.so

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
	./fuser.py $(FILENAME)-hip-amdgcn-amd-amdhsa-$(GFXARCH).s > fused.s
	@./assemble.sh
	mpirun.mpich -np 16 -env AMD_KERNEL_FUSION=1 -env AMD_KERNEL_FUSION_HOST=_Z7kernel1PKfS0_Pf -env AMD_KERNEL_FUSION_GUEST=_Z24mscclKernel_Sum_float_LLP11ncclDevCommP9mscclAlgo9mscclWork -env LD_PRELOAD=$(HIP_LIBRARY):$(RCCL_LIBRARY) ./fused.exe

test: $(EXECUTABLE)
	@echo "\n==== Back-to-back Kernels  ====\n"
	mpirun.mpich -np 16 -env LD_PRELOAD=$(HIP_LIBRARY):$(RCCL_LIBRARY) $(EXECUTABLE)

clean:
	@rm -f $(EXECUTABLE)
	@rm -f $(OBJECTS)
	@rm -f *.o *.co
	@rm -f $(FILENAME)-*
	@rm -f $(SOURCES)-*
	@rm -f fused_manifest.txt fused.exe fused.s
	@rm -rf __pycache__
