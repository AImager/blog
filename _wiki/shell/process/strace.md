---
layout: wiki
tags: [进程,系统调用]
---

## 功能描述

查看进程的系统调用，mac下使用dtruss

## 实例

```shell
# strace -p 1022
跟踪pid为1022的系统调用
# strace所有线程
strace -fp `ps auxw -T | grep program_to_trace | grep -v grep | awk {print $2}`
```

### -p

通过pid监听进程

### -o

输出重定向到文件，strace命令不支持管道输出

### -e

设置监听选项

```shell
# 跟踪与网络有关的所有系统调用.
-e trace=network
```

### -f

同时监听fork出来的子进程

### -F

同时监听vfork出来的子进程

### -T

显示每个调用的耗时时间，精确到微秒，在每行最后显示

### -tt

显示调用开始时间，精确到微秒，在每行开头显示


## 参考链接

* [科学使用strace神器](https://www.cnblogs.com/sunsky303/p/6531943.html)