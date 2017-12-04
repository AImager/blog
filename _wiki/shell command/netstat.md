---
title: netstat
layout: wiki
category: shell command
tag: [端口,网络,socket]
---

## 功能描述

用于查看网络连接信息


## 实例

```
# 显示当前所有tcp连接
netstat -anpt

# 查看数据库对应服务的数据库连接数，要看非自己的进程id，需要root权限
sudo netstat -apn | grep 100.99.3.96:3306 | grep server | wc -l
```

### -l

只列出状态为监听的socket

### -n

显示的时候尽量以数字IP的方式显示地址

### -p

显示连接的进程名与pid

### -a

列出所有socket

### -t

列出tcp的socket

### -u

列出udp的socket

### -r

展示路由表
