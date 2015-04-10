---
title: Linux高级指令索引
layout: post
tag: [Shell,参考手册,Linux]
---




## 支持通配符的命令

```
ls
cd
```

## 支持正则表达式的命令

man -K



## grep和find

```
grep <data> <stream>：在流中搜索对应信息行
  -v：搜索非信息行
  -n：显示行号
  -c：仅显示可匹配的行数
  -e：或匹配
```



## 网络工具

```
wget：下载工具，接url
tcpdump：
curl：
```



## 程序分析工具

```
ar
  -x：解包静态库
  -t：查看静态库
readelf
  -S：查看目标文件的段描述
  -h：查看目标文件的头文件属性
ld
  -e：指定起始函数名
objdump
  -s：目标文件以十六进制显示
  -d：将指令段反编译
  -h：查看ELF格式
pmap
  -d：显示进程号对应的详细信息
objcopy：段设置工具
xxd：查看文件的二进制信息
```
