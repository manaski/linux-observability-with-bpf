动态追踪内核探针需要和运行的内核版本匹配，可以通过以下指令查看支持的内核探针
```shell
bpftrace -l | grep 'kprobe:*'
```
同样的也可以用于其他类型探针的查询
```shell
bpftrace -l | grep 'tracepoint:*'
```
