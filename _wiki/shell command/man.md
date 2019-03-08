---
title: man
layout: wiki
category: shell command
tags: [帮助]
---

## 功能描述

查看命令手册，手册分为以下8类，即man1-man8

* General commands
* System calls
* Library functions, covering in particular the C standard library
* Special files (usually devices, those found in /dev) and drivers
* File formats and conventions
* Games and screensavers
* Miscellanea
* System administration commands and daemons

## 实例

```shell
# 查看系统调用syscalls帮助
man 2 syscalls
```

### -k

正则搜索全部的man页面
