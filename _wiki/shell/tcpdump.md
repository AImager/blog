---
title: tcpdump
layout: wiki
category: shell
tags: [网络,抓包]
---


## FLAGS

* F : FIN - 结束; 结束会话
* S : SYN - 同步; 表示开始会话请求
* R : RST - 复位;中断一个连接
* P : PUSH - 推送; 数据包立即发送
* A : ACK - 应答
* U : URG - 紧急
* E : ECE - 显式拥塞提醒回应
* W : CWR - 拥塞窗口减少

## 实例

~~~

~~~

## -A

以ASCII形式显示每一个数据包

## -i <interface>

指定所要监听的网卡，默认为any，即所有

## -XX

以十六进制显示包内容，包括数据链路层的头部

## port <port>

指定监听端口

## host <address>

指定监听的地址

## -F <file>

将文件内容作为过滤条件

## -r <file>

从文件中读取包数据

## -s <snaplen>

设定抓取的包长度，为0时表示自动设置长度
