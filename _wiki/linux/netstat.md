---
title: netstat
layout: wiki
category: linux
tag: [端口,网络,连接]
---

## 功能描述

用于查看网络连接信息


## 实例

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
~ netstat -anpt		# 显示当前所有tcp连接

~ sudo netstat -apn | grep 100.99.3.96:3306 | grep server | wc -l  # 查看数据库对应服务的数据库连接数，要看非自己的进程id，需要root权限
~~~
