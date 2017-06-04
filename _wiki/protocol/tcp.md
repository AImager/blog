---
title: tcp
layout: wiki
category: protocol
tags: [传输层]
---

![](/media/img/protocol/TCP Header.jpeg)

## TCP Header

* Source Port: 源端口号
* Destination Port: 目的端口号
* Sequence Number: 序列号
* Acknowledgment Number: 确认号
* Offset
* Reserved
* TCP Flags
* Window
* Checksum
* Urgent Pointer
* TCP Options

## TCP Flags

* CWR: Congestion Window Reduced，拥塞窗口减少
* ECE: ECN-Echo，显示拥塞提醒回应
* URG: Urgent，紧急
* ACK: Acknowledgment，应答
* PSH: Push，推送，表示数据包应立即发送
* RST: Reset，复位，表示中断一个连接
* SYN: Syn，同步，表示开始一个会话
* FIN: Fin，结束会话

## 会话

![](/media/img/protocol/TCP Transfer.jpeg)

一图胜千言，三次握手和四次挥手原理简单，就不赘述了



## 流量控制

流量控制主要指通过某些方法，限制通信双方的数据传输速率，其主要是通过限制单位时间内send的频次来实现的，至于限制的算法，主要有Nagle等。

## 拥塞控制

相对于流量控制里端对端的控制，拥塞控制则是对整个网络的控制，常用的方法有慢开始、拥塞避免、快重传和快恢复等。


## TCP状态变迁

![](/media/img/protocol/TCP Status.png)


## 参考链接

* [RFC793 TCP](https://www.rfc-editor.org/info/rfc793)
* [TCP的流量控制和拥塞控制](http://blog.sina.com.cn/s/blog_6988593e01015wu0.html)
