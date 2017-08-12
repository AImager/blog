---
title: traceroute
layout: wiki
category: shell
tags: [网络,路由]
---

## 功能描述

获取到目标地址的路由情况

## 常规实现

traceroute主要依赖于icmp协议，通过依次发出ttl为1/2/3...的ping包来获得第1/2/3...跳的地址与时间，但很多服务器防止探测，都把对应的功能禁止掉了。

## 实例

~~~
# 查看到qq.com的路由
traceroute qq.com
~~~