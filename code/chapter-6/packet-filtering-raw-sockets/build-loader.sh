KERNEL_SRCTREE=/usr/src/linux-5.13.0

set -ex

# 静态编译
LIBBPF=${KERNEL_SRCTREE}/tools/lib/bpf/libbpf.a

# 动态编译
#LIBBPF=-L${KERNEL_SRCTREE}/tools/lib/bpf
#LIBBPF="${LIBBPF} -lbpf"


clang -o loader -I${KERNEL_SRCTREE}/tools/lib/bpf/ \
  -I${KERNEL_SRCTREE}/tools/lib -I${KERNEL_SRCTREE}/tools/include \
  -I${KERNEL_SRCTREE}/tools/perf -I${KERNEL_SRCTREE}/samples/bpf \
  ${KERNEL_SRCTREE}/samples/bpf/bpf_load.c \
  loader.c ${LIBBPF} -lz -lelf
