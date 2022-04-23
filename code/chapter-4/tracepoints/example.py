#!/usr/bin/python3

from bcc import BPF

bpf_source = """
int trace_random(struct pt_regs *ctx) {
  char comm[16];
  bpf_get_current_comm(&comm, sizeof(comm));

  bpf_trace_printk("%s is using random", comm);
  return 0;
}
"""

bpf = BPF(text = bpf_source)
bpf.attach_tracepoint(tp = "random:urandom_read", fn_name = "trace_random")
bpf.trace_print()
