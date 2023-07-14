HIP_PATH?= $(wildcard /opt/rocm/hip)
ifeq (,$(HIP_PATH))
	HIP_PATH=/opt/rocm
endif

HIPCC=$(HIP_PATH)/bin/hipcc

TARGET=hcc

SOURCES = vectoradd_hip.cpp
OBJECTS = $(SOURCES:.cpp=.o)

EXECUTABLE=./vectoradd_hip.exe

.PHONY: test


all: $(EXECUTABLE) test

CXXFLAGS =-O3 -save-temps

CXX=$(HIPCC)


$(EXECUTABLE): $(OBJECTS) 
	$(HIPCC) $(OBJECTS) -o $@

fuse: $(EXECUTABLE) test
	@echo "\n==== Kernel Fusion ====\n"
	./fuser.py > fused.s
	./assemble.sh
	LD_PRELOAD=~/hipamd/build/lib/libamdhip64.so ./fused.exe
	@AMD_LOG_LEVEL=4 LD_PRELOAD=~/hipamd/build/lib/libamdhip64.so ./fused.exe 1>/dev/null 2>run.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run.log | wc -l`"
	@rm -f run.log

test: $(EXECUTABLE)
	@echo "\n==== Back-to-back Kernels  ====\n"
	$(EXECUTABLE)
	@AMD_LOG_LEVEL=4 $(EXECUTABLE) 1>/dev/null 2>run.log
	@echo "Number of AQL packets submitted: `grep kernel_obj run.log | wc -l`"
	@rm -f run.log

clean:
	@rm -f $(EXECUTABLE)
	@rm -f $(OBJECTS)
	@rm -f *.o
	@rm -f vectoradd_hip-*
	@rm -f $(SOURCES)-*
	@rm -f fused.s fused.exe
