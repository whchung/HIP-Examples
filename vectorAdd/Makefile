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

CXXFLAGS =-g

CXX=$(HIPCC)


$(EXECUTABLE):
	$(HIPCC) $(SOURCES) -o $@ -save-temps


test: $(EXECUTABLE)
	$(EXECUTABLE)


clean:
	rm -f $(EXECUTABLE)
	rm -f $(OBJECTS)
	rm -f $(HIP_PATH)/src/*.o
	rm -f *.o *.cui *.bc *.hipfb *.out *.resolution.txt

