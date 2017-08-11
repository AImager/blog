---
title: iptables
layout: wiki
category: shell
tags: [防火墙]
---

## 功能描述

iptables是很多发行版的默认防火墙服务，centos7换成了firewall。iptables一般作为系统服务通过service或者systemctl开启关闭。

## 实例

~~~
# 以数字形式显示iptables的所有规则
iptables --list -n

# 开放22端口的进流量
iptables -A INPUT -d 192.168.42.153 -p tcp --dport 22 -j ACCEPT

# 开放22端口的出流量
iptables -A  OUTPUT -s  192.168.42.153  -p tcp  --sport  22 -j ACCEPT
~~~