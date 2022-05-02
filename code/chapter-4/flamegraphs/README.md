1. 编译golang程序
```
go build -o main main.go
```
2. 执行bcc程序
```shell
./bcc_example.py 'pgrep -nx go' > profile.out
```
3. 转换成火焰图
```shell
./flamegraph.pl profile.out > flamegraph.svg
```