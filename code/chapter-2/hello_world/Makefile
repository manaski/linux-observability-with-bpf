CLANG = clang

EXECABLE = monitor-exec

BPFCODE = bpf_program

KERNEL_SRC = /usr/src/linux-5.13.0

BPFLOADER = ./bpf_load.c

CCINCLUDE += -I$(KERNEL_SRC)/tools/testing/selftests/bpf
BPFTEST = $(KERNEL_SRC)/tools/testing/selftests/bpf/trace_helpers.c

LOADINCLUDE += -I$(KERNEL_SRC)/samples/bpf
LOADINCLUDE += -I$(KERNEL_SRC)/tools/lib
LOADINCLUDE += -I$(KERNEL_SRC)/tools/lib/bpf
LOADINCLUDE += -I$(KERNEL_SRC)/tools/perf
LOADINCLUDE += -I$(KERNEL_SRC)/tools/include
LOADINCLUDE += -I$(KERNEL_SRC)/tools/testing/selftests/bpf
LIBRARY_PATH += -L$(KERNEL_SRC)/tools/lib/bpf	# bpf库安装目录
BPFSO = -lbpf	# 链接动态库

.PHONY: clean bpfload build

clean:
	rm -f *.o *.so $(EXECABLE)

build: ${BPFCODE.c} ${BPFLOADER}
	$(CLANG) -O2 -target bpf -c $(BPFCODE:=.c) $(CCINCLUDE) -o ${BPFCODE:=.o}

bpfload: build
	clang -o $(EXECABLE) -lelf $(LOADINCLUDE) $(LIBRARY_PATH) $(BPFSO)\
        $(BPFLOADER) $(BPFTEST) loader.c

$(EXECABLE): bpfload

.DEFAULT_GOAL := $(EXECABLE)
