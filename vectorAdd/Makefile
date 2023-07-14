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
	./fuser.py > fused.s
	./assemble.sh
	LD_PRELOAD=~/hipamd/build/lib/libamdhip64.so ./fused.exe

test: $(EXECUTABLE)
	$(EXECUTABLE)


clean:
	rm -f $(EXECUTABLE)
	rm -f $(OBJECTS)
	rm -f *.o
	rm -f vectoradd_hip-*
	rm -f $(SOURCES)-*
	rm -f fused.s fused.exe
