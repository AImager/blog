---
title: Epoll
layout: post
tags: [网卡]
---

本文主要介绍Linux下网卡收包的流程，这其中主要涉及到网卡的原理以及链路层和物理层的工作原理。整个过程的全景图如下，下面一步一步来说。

![网卡收包流程](/media/img/NIC.png)

## 零. 名词解释

NIC: 网卡

## 一. 数据包到内存

数据包到内存的过程比较简单，只涉及到图中的1过程，即电信号被NIC捕获（对这个过程感兴趣的可以学习下电路相关的知识）生成数据包，然后DMA将数据包写入到指定内存（即图中流程1下的蓝色数据库）。这个内存空间是驱动在初始化的时候分配的，所有的数据帧都只有驱动能理解，因此可以把这部分空间理解为一个数据包中转区。

## 二. 数据包生成sk_buff

数据包进内存后，NIC会触发硬中断（IRQ），通知CPU有数据来了，CPU根据中断向量表调用中断函数，然后中断函数调用NIC驱动注册的函数。

NIC

## 关键数据结构

### glibc

`glibc-2.30/sysdeps/mach/hurd/connect.c`

`int __connect (int fd, __CONST_SOCKADDR_ARG addrarg, socklen_t len)`

### kernel

`linux-4.20.17/include/linux/skbuff.h`

`struct sk_buff`


`linux-4.20.17/net/socket.c`

`SYSCALL_DEFINE2(socketcall, int, call, unsigned long __user *, args)`


`linux-4.20.17/include/linux/netdevice.h`

`struct napi_struct`

`struct net_device`

## 参考链接

* [Linux协议栈--套接字的实现](http://cxd2014.github.io/2016/07/30/socket-implement/)
* [Linux网络 - 数据包的接收过程](https://segmentfault.com/a/1190000008836467)
* [Linux 系统内核空间与用户空间通信的实现与分析](https://www.ibm.com/developerworks/cn/linux/l-netlink/index.html)