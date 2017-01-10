---
title: tc
layout: wiki
category: shell
tags: [包控制]
---

## 实例

~~~Text
tc qdisc add dev eth0 root netem delay 1000ms		//模拟网络延时1000ms

tc qdisc del dev eth0 root netem delay 1000ms		//删除网络延时策略

tc qdisc add dev eth0 root netem loss 10%			//模拟10%的丢包率

tc qdisc add dev eth0 root netem delay 10ms reorder 25% 50%		//模拟指定25%的包延迟10ms发送

tc qdisc add dev eth0 root netem duplicate 1%		//模拟1%的重复包
~~~
