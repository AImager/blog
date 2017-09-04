---
title: telnet
layout: wiki
category: shell command
tags: [网络,端口测试,远程登录]
---

## 功能描述

基于telnet应用层协议的客户端工具，提供远程登录（协议默认功能）以及应用层通信（远程登录其实也包含应用层通信）的功能。

### 与telnet协议的关系

在C/S模型下，网络协议的实现一般需要两方，所以talnet和telnet-server共同构成telnet协议的一个实现，但telnet客户端实现telnet协议后并不仅仅作为远程登录使用，它还可以连接web服务端口，通过get/post方法来模拟web通信，也可以通过连通性来测试端口的服务状态。所以，telnet实际上算一个最基础的应用层通信客户端。

## 实例

~~~Text
# 测试100.102的8088端口是否对内网开放
telnet 192.168.100.102 8088

# 登录100.102的服务器
telnet 192.168.100.102
~~~

## 参考链接

* [TELNET: THE MOTHER OF ALL (APPLICATION) PROTOCOLS](http://www2.sims.berkeley.edu/courses/is250/s99/articles/w3088.pdf)