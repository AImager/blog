---
title: sysctl
layout: wiki
category: shell command
tags: [msl]
---

## 功能描述

配置和显示内核参数

## 实例

~~~
# 查看msl时间设置『秒』
sysctl net.ipv4.tcp_fin_timeout

# bsd系统下查看msl时间设置『毫秒』
sysctl net.inet.tcp.msl	
~~~
