---
title: crontab
layout: wiki
category: shell command
tags: [定时任务]
---

## 功能描述

定时执行相关程序或命令

## 实例

```
# 编辑root的crontab
crontab -u root
```

### -u <user>

设定user用户的cron服务

### -e

编辑cron服务

### -l

列出cron服务

### -r

删除cron服务

### -i

删除cron服务前给出提示

## 语法

```
编辑时是以文件编辑的形式，其语法规则如下
<Minute> <Hour> <Day> <Month> <Dayofweek> <command>
  "*"：代表所有的取值范围内的数字
  "/"：代表"每"
  "-"：代表从某个数字到某个数字
  ","：分开几个离散的数字

30 7 8 * * ls：指定每月8号的7：30分执行ls命令

*/2 * * * * echo "Hello World."：每两分钟显示字符串

1,2,3 * * * * echo "Hello World."：每小时的1,2,3分钟显示字符串
```
