---
title: arp
layout: wiki
category: linux
tags: [arp协议]
---

## 功能描述

## OPTIONS

### -a

显示所有arp缓存，查询显示

### -n

直接查看arp缓存（mac不适用）

## 实例

~~~Bash
-> ~ arp -n|awk '/^[1-9]/{system("arp -d "$1)}'          # 清空所有的arp缓存，不适用mac
~~~
