---
title: man
layout: wiki
category: shell
tags: [帮助]
---

## 功能描述

查看命令手册，手册分为以下8类

* General commands
* System calls
* Library functions, covering in particular the C standard library
* Special files (usually devices, those found in /dev) and drivers
* File formats and conventions
* Games and screensavers
* Miscellanea
* System administration commands and daemons

## 实例

~~~
man <command>
~~~

### -k <pattern>

搜索全部的man页面，匹配pattern，支持正则表达式（实际上就是通过grep来搜索的）
