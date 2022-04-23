CLANG = clang

EXECABLE = loader-bin

KERNEL_SRC = /usr/src/linux-5.13.0

BPFLOADER = $(KERNEL_SRC)/samples/bpf/bpf_load.c

LOADINCLUDE += -I$(KERNEL_SRC)/samples/bpf
LOADINCLUDE += -I$(KERNEL_SRC)/tools/lib
LOADINCLUDE += -I$(KERNEL_SRC)/tools/perf
LOADINCLUDE += -I$(KERNEL_SRC)/tools/include
LOADINCLUDE += -I$(KERNEL_SRC)/tools/testing/selftests/bpf
LIBRARY_PATH = -L/usr/local/lib64
LIBRARY_PATH += -L$(KERNEL_SRC)/tools/lib/bpf
BPFSO = -lbpf

.PHONY: bpfload


bpfload:
	clang -o $(EXECABLE) -lelf $(LOADINCLUDE) $(LIBRARY_PATH) $(BPFSO)\
        $(BPFLOADER) loader.c

$(EXECABLE): bpfload

.DEFAULT_GOAL := $(EXECABLE)
