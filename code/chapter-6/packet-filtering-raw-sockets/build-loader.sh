KERNEL_SRCTREE=/usr/src/linux-5.13.0

LIBBPF=${KERNEL_SRCTREE}/tools/lib/bpf/libbpf.a

clang -o loader-bin -I${KERNEL_SRCTREE}/tools/lib/bpf/ \
  -I${KERNEL_SRCTREE}/tools/lib -I${KERNEL_SRCTREE}/tools/include \
  -I${KERNEL_SRCTREE}/tools/perf -I${KERNEL_SRCTREE}/samples \
  ${KERNEL_SRCTREE}/samples/bpf/bpf_load.c \
  loader.c "${LIBBPF}" -lelf
