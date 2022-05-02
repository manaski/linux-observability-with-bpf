1. 编译c程序
```
gcc -o hello_usdt hello_usdt.c
```
2. 查看usdt信息(SystemTap probe descriptors)
```shell
readelf -n ./hello_usdt
tplist -l ./hello_usdt
```
3. 根据符号编写bcc程序并运行跟踪
```
sudo ./example.py
```

ruby版本的没有尝试