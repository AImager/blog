---
layout: wiki
tags: [任务管理]
---

## 功能描述

动态显示系统资源利用情况，默认每三秒中更新一次数据


## 显示描述

```
top - 17:02:27 up  9:40,  1 user,  load average: 0.04, 0.08, 0.06
Tasks: 208 total,   1 running, 207 sleeping,   0 stopped,   0 zombie
%Cpu(s):  4.7 us,  1.7 sy,  0.0 ni, 93.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1528316 total,    43012 free,   834828 used,   650476 buff/cache
KiB Swap:  2702332 total,  2665364 free,    36968 used.   623096 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1032 root      20   0  518572  78364  16120 S   6.7  5.1   5:59.73 Xorg
```


* up  9:40: 运行时间
* 1 user: 登录用户数量
* load average: 系统负载，运行状态进程1/5/15分钟内的平均数，数据默认每5秒钟采集一次
* Tasks: 这一行显示任务数量，包括运行/等待/停止/僵尸进程
* %Cpu(s): us用户空间CPU占比，sy内核空间CPU占比，ni用户空间内改变过优先级的进程CPU占比，id空闲CPU占比，wa等待IO的CPU占比

* PR: 优先级，值越小，优先级越高
* NI: 优先级偏移值，也称为nice值，与PR值相加是最终的优先值
* VIRT: 使用的虚拟内存总量，单位kb
* RES: 进程使用的，未被换出的内存大小，单位kb
* SHR: 共享内存大小，单位kb
* S: 进程状态，D不可中断的睡眠状态，R运行状态，S睡眠状态，T跟踪/停止状态，Z僵尸状态
* TIME+: 进程占用的CPU时间，按核心算，精度为1/100秒，5:59.73即5分59.73秒


## 实例

```
# 交互实时显示资源占用情况
top
```

### 按键

* M: 按照内存排序
* P: 按照CPU使用率排序，默认





