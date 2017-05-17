---
title: ipcs
layout: wiki
category: shell
tags: [进程通信,IPC,查看]
---

## 功能描述

查看进程通信状态

## 实例

~~~
# 查看系统使用的IPC共享内存资源
ipcs -m 

# 查看系统使用的IPC队列资源
ipcs -q 

# 查看系统使用的IPC信号量资源
ipcs -s 
~~~
