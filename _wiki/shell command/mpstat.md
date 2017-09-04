---
title: mpstat
layout: wiki
category: shell command
tags: [CPU,状态信息]
---


## 功能描述

显示CPU使用状态信息，所有信息来源于/proc/stat文件。

## 实例

~~~
# 显示所有CPU状态信息，设置internal时间为5s，抓取2次信息
mpstat -P ALL 5 2
~~~

## /proc/stat结构

## 显示描述

* `%usr = usr/total*100`: 在internal时间段里，用户态的CPU时间（%），不包含nice值为负的进程
* `%nice = nice/total*100`: 在internal时间段里，nice值为负的进程所占用的CPU时间（%）
* `%sys = system/total*100`: 在internal时间段里，内核占用时间（%）
* `%iowait = iowait/total*100`: 在internal时间段里，硬盘IO等待时间（%）
* `%irq = irq/total*100`: 在internal时间段里，硬中断时间（%）
* `%soft = softirq/total*100`: 在internal时间段里，软中断时间（%）
* `%steal = steal/total*100`
* `%guest = guest/total*100`
* `%gnice = gnice/total*100`
* `%idle = idle/total*100`: 在internal时间段里，除去等待磁盘IO操作外的空闲时间（%）

以下为CPU总时间，mpstat不显示，但数据都可以由显示数据计算得到。其中cur表示当前实时数据，pre表示上个internal结束时的数据。

* `total_cur = user+system+nice+idle+iowait+irq+softirq`
* `user = user_cur–user_pre`
* `total = total_cur-total_pre`