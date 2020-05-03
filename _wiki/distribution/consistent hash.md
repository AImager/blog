---
layout: wiki
tags: [一致性哈希]
---

## 解决的问题

解决分布式的热点访问问题

## CARP (Cache Array Routing Protocol)

直接hash的请求，没有解决cache节点增加、减少导致的大部分数据需要重新分配的问题。

假设数据非常均匀，比较取模hash的CARP和一致性哈希。当n节点扩大为m节点的时候，取模hash数据变换节点的概率为 $\frac{lcm(n,m)-n}{lcm(n,m)}$，一致性哈希数据变换节点的概率要小很多（这个真不好算）。

## 参考链接

* [Consistent hashing and random trees](http://dl.acm.org/citation.cfm?id=258660)