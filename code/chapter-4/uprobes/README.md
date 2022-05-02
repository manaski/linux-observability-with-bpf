编译golang程序
```golang
go build -o main main.go
```
跟踪用户探针需要获取elf对象文件中的符号列表，可以使用nm指令
```shell
nm main | grep main
```
