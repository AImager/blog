---
title: arp
layout: wiki
category: shell command
tags: [arp协议]
---

## 功能描述

arp缓存管理

## 实例

~~~
# 清空所有的arp缓存
# mac不行
arp -n | awk '/^[1-9]/{system("arp -d "$1)}'          
~~~

### -a

显示所有arp缓存，查询显示

### -n

直接查看arp缓存