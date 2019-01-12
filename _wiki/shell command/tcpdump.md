---
title: tcpdump
layout: wiki
category: shell command
tags: [网络,抓包,sudo]
---




## 实例

```shell
# 监听eth0网卡本地8097端口的活动，不截断，以ASCII形式显示
# 保存为pcap文件
tcpdump -i eth0 -s 0 -A host 127.0.0.1 and port 8097 -w res.pcap
```

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

### -w

保存为文件

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



## 参考链接

* [使用 wireshark 查看 tcpdump 的抓包结果](https://mozillazg.github.io/2015/05/open-tcpdump-result-with-wireshark-gui.html)
* [使用tcpdump查看HTTP请求响应](https://www.jianshu.com/p/3cca9a74927c)
