---
title: strace
layout: wiki
category: shell
tags: [进程,系统调用]
---

## 功能描述

查看进程的系统调用

## 实例

~~~Text
# strace -p 1022
跟踪pid为1022的系统调用
~~~

### -p

通过pid监听进程

### -o

输出重定向到文件

### -e

设置监听选项

### -f

同时监听fork出来的子进程

### -F

同时监听vfork出来的子进程
