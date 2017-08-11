---
title: mpstat
layout: wiki
category: shell
tags: [CPU,状态信息]
---


## 功能描述

显示CPU使用状态信息

## 显示描述

* %usr=usr/total*100: 在internal时间段里，用户态的CPU时间（%），不包含nice值为负的进程
* %nice=nice/total*100: 在internal时间段里，nice值为负的进程所占用的CPU时间（%）
* %sys=system/total*100: 在internal时间段里，内核占用时间（%）
* %iowait=iowait/total*100: 在internal时间段里，硬盘IO等待时间（%）
* %irq=irq/total*100: 在internal时间段里，硬中断时间（%）
* %soft=softirq/total*100: 在internal时间段里，软中断时间（%）
* %steal=steal/total*100
* %guest=guest/total*100
* %gnice=gnice/total*100
* %idle=idle/total*100: 在internal时间段里，除去等待磁盘IO操作外的空闲时间（%）