---
title: php session文件锁
layout: qa
category: php
---


## php session文件锁导致进程阻塞

* 错误描述：
* 原因：当单客户端短时间高频率访问，导致对应的session文件锁来不及释放，从而导致进程阻塞
* 检测：strace
* 解决：换用redis等内存数据库存session