KERNEL_SRCTREE=/usr/src/linux-5.13.0

# 静态编译
LIBBPF=${KERNEL_SRCTREE}/tools/lib/bpf/libbpf.a
#LIBPATH=${KERNEL_SRCTREE}/tools/lib/bpf

# 动态编译
# LIBBPF=${KERNEL_SRCTREE}/tools/lib/bpf
# LIBBPF+= -lbpf


clang -o loader-bin -I${KERNEL_SRCTREE}/tools/lib/bpf/ \
  -I${KERNEL_SRCTREE}/tools/lib -I${KERNEL_SRCTREE}/tools/include \
  -I${KERNEL_SRCTREE}/tools/perf -I${KERNEL_SRCTREE}/samples/bpf \
  ${KERNEL_SRCTREE}/samples/bpf/bpf_load.c \
  loader.c "${LIBBPF}" -lz -lelf
