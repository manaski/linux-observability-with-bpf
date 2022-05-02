CLANG = clang

KERNEL_SRC = /usr/src/linux-5.13.0
INCLUDE_PATH = -I$(KERNEL_SRC)/tools/lib/bpf

LIBRARY_PATH = -L/usr/local/lib64
LIBRARY_PATH += -L$(KERNEL_SRC)/tools/lib/bpf
BPFSO = -lbpf

.PHONY: clean 

clean:
	rm -f fetch save

fetch: 	map_pinning_fetch.c 
	clang -o fetch -lelf $(INCLUDE_PATH) $(LIBRARY_PATH) $(BPFSO) $?

save: 	map_pinning_save.c
	clang -o save -lelf $(INCLUDE_PATH) $(LIBRARY_PATH) $(BPFSO) $?

delete:  map_pinning_delete.c
	clang -o delete -lelf $(INCLUDE_PATH) $(LIBRARY_PATH) $(BPFSO) $?

iterate:  map_pinning_iterate.c
	clang -o iterate -lelf $(INCLUDE_PATH) $(LIBRARY_PATH) $(BPFSO) $?

build: fetch save delete iterate

.DEFAULT_GOAL := build
