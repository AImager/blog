---
layout: wiki
tag: [抓包]
---

## filter

* ip.src == 127.0.0.1 : ip的源地址
* ip.dst == 127.0.0.1 : ip的目的地址
* http : 选择协议
* tcp.port == 8888      : tcp端口
* tcp.srcport == 80     : tcp源端口
* eth.addr == 00:11:22:33:44:55     : 物理地址

多个过滤条件使用or或者and连接构成复合条件


## 参考链接

* [wireshark使用教程及过滤语法总结](http://www.zhoulujun.cn/zhoulujun/html/theory/network/2016_1130_7908.html)
* [mac 彻底解决 wireshark 权限不足的问题](https://awen.me/post/43366.html)