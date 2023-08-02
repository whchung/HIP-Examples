HIP_PATH?= $(wildcard /opt/rocm/hip)
ifeq (,$(HIP_PATH))
	HIP_PATH=/opt/rocm
endif

HIPCC=$(HIP_PATH)/bin/hipcc
HIP_LIBRARY=~/projects/hipamd/build/lib/libamdhip64.so

FILENAME = vectoradd_hip
SOURCES = $(FILENAME).cpp
OBJECTS = $(SOURCES:.cpp=.o)
GFXARCH = $(shell rocm_agent_enumerator | tail -1)

EXECUTABLE=./$(FILENAME).exe

.PHONY: test


all: $(EXECUTABLE) test

CXXFLAGS =-O3 -save-temps

CXX=$(HIPCC)


$(EXECUTABLE): $(OBJECTS) 
	$(HIPCC) $(OBJECTS) -o $@

fuse: $(EXECUTABLE) test
	@echo "\n==== Kernel Fusion ====\n"
	./fuser.py $(FILENAME)-hip-amdgcn-amd-amdhsa-$(GFXARCH).s manifest > fused_manifest.txt
	./fuser.py $(FILENAME)-hip-amdgcn-amd-amdhsa-$(GFXARCH).s > fused.s
	./assemble.sh
	AMD_KERNEL_FUSION=1 AMD_KERNEL_FUSION_HOST=`head -1 fused_manifest.txt` AMD_KERNEL_FUSION_GUEST=`tail -1 fused_manifest.txt` ROC_USE_FGS_KERNARG=0 LD_PRELOAD=$(HIP_LIBRARY) ./fused.exe
	@AMD_KERNEL_FUSION=1 AMD_LOG_LEVEL=4 AMD_KERNEL_FUSION_HOST=`head -1 fused_manifest.txt` AMD_KERNEL_FUSION_GUEST=`tail -1 fused_manifest.txt` ROC_USE_FGS_KERNARG=0 LD_PRELOAD=$(HIP_LIBRARY) ./fused.exe 1>/dev/null 2>run.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run.log | wc -l`"
	@rm -f run.log

test: $(EXECUTABLE)
	@echo "\n==== Back-to-back Kernels  ====\n"
	ROC_USE_FGS_KERNARG=0 LD_PRELOAD=$(HIP_LIBRARY) $(EXECUTABLE)
	@AMD_LOG_LEVEL=4 ROC_USE_FGS_KERNARG=0 LD_PRELOAD=$(HIP_LIBRARY) $(EXECUTABLE) 1>/dev/null 2>run.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run.log | wc -l`"
	@rm -f run.log

clean:
	@rm -f $(EXECUTABLE)
	@rm -f $(OBJECTS)
	@rm -f *.o *.co
	@rm -f $(FILENAME)-*
	@rm -f $(SOURCES)-*
	@rm -f fused_manifest.txt fused.s fused.exe
	@rm -rf __pycache__
