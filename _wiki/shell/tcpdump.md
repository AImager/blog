---
title: tcpdump
layout: wiki
category: shell
tags: [网络,抓包,sudo]
---




## 实例

~~~
# 监听eth0网卡本地8097端口的活动，不截断，以ASCII形式显示
tcpdump -i eth0 -s 0 -A host 127.0.0.1 and port 8097
~~~

### -A

以ASCII形式显示每一个数据包

### -i <interface>

指定所要监听的网卡，默认为any，即所有

### -XX

以十六进制显示包内容，包括数据链路层的头部

### port

指定监听端口

### host

指定监听的地址

### -s 

设定抓取的包长度，为0时表示自动设置长度

## 显示描述

### FLAGS

* F : FIN - 结束; 结束会话
* S : SYN - 同步; 表示开始会话请求
* R : RST - 复位;中断一个连接
* P : PUSH - 推送; 数据包立即发送
* A : ACK - 应答
* U : URG - 紧急
* E : ECE - 显式拥塞提醒回应
* W : CWR - 拥塞窗口减少
