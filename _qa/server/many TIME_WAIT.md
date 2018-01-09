---
title: many TIME_WAIT
layout: qa
category: server
---

## many TIME_WAIT

* 错误描述：
* 可能原因：并发高，可能是syn攻击
* 检测：监控netstat
* 解决：`net.ipv4.tcp_tw_recycle`表示time_wait的socket快速回收状态，默认为0关闭；`net.ipv4.tcp_fin_timeout`表示msl时间，2倍msl时间后time_wait会关闭，一般默认为60s；`net.ipv4.tcp_tw_reuse`表示time_wait的socket重用状态，默认为0关闭；`net.ipv4.tcp_syncookies`表示开启syn cookies开启状态，默认为0关闭。