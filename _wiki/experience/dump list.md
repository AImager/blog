---
title: dump list
layout: wiki
category: experience
tags: [dump]
---


## 502 Bad Gateway

* 原因：连接超时
	* 检测：以LNMP架构来说，查慢查询、php日志
	* 解决：根据log修复数据
	
## php session文件锁

* 原因：当单客户端短时间高频率访问，导致对应的session文件锁来不及释放，从而导致进程阻塞
	* 检测：strace
	* 解决：换用redis等内存数据库存session

## 段错误，核心已转储

* 原因：访问内存越界
	* 检测：gdb
	* 解决：debug

## many TIME_WAIT

* 原因：并发高，可能是syn攻击
	* 检测：监控netstat
	* 解决：`net.ipv4.tcp_tw_recycle`表示time_wait的socket快速回收状态，默认为0关闭；`net.ipv4.tcp_fin_timeout`表示msl时间，2倍msl时间后time_wait会关闭，一般默认为60s；`net.ipv4.tcp_tw_reuse`表示time_wait的socket重用状态，默认为0关闭；`net.ipv4.tcp_syncookies`表示开启syn cookies开启状态，默认为0关闭。
