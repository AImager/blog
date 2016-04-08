---
title: netstat
layout: wiki
category: linux
tag: []
---

## 功能描述

用于查看网络连接信息


## OPTIONS

~~~
~~~

### -l

列出监听端口

### -n

打印IP地址

### -p

显示连接的程序名

### -a

列出所有端口

### -t

列出tcp端口

### -u

列出udp端口

## 实例

~~~Bash
➜ ~ netstat -anpt		# 显示当前所有tcp连接

根据状态【State】列查看，LISTEN表示监听

~~~
