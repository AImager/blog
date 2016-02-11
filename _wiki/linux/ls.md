---
title: ls
layout: wiki
category: linux
tags: [显示,目录,文件,通配符]
---

## 功能描述

显示目录下的文件或者直接显示文件

对于类型为非目录的操作数[files]，ls显示每个操作数的命名以及任何所需的相关联信息。对于类型为目录的操作数，ls显示每个操作数的命名、每个操作数包含的文件名以及任何所需的相关联信息。

如果没有操作数，当前目录的内容被显示。非目录操作数优先，目录与非目录的操作数分别按字典顺序排序。


## OPTIONS

~~~
ls [options] ... [files [...]]
~~~

### -a, --all

显示包括以.开头的所有文件

### -A, --almost-all

不显示.和..

### -l

格式化显示文件的详细信息

### -h

以可读的方式（K,M,G）显示文件大小，必须结合-h使用

### -d, --directory

目录以空文件的方式列出，在匹配的时候不进行递归

### -G

允许颜色显示，BSD颜色变量为LSCOLORS，Linux为LS_COLORS

### -S

由大到小排序，默认是按名称排序

### -t

通过最近修改时间排序

### -F

在不同类型文件后面添加标识，目录后面加/，执行文件夹*等

## 实例

~~~Bash
➜ ~ ls -alh           # 显示当前目录下全部文件的详细信息
总用量 400K
drwxr-xr-x 26 cong cong 4.0K 11月  9 16:02 .
drwxr-xr-x  4 root root 4.0K 10月 17 15:17 ..
drwx------  2 cong cong 4.0K 11月  9 15:08 .aptitude
-rw-------  1 cong cong 5.2K 10月 26 16:12 .bash_history
-rw-r--r--  1 cong cong  220 10月 17 15:17 .bash_logout
-rw-r--r--  1 cong cong 3.5K 10月 17 15:17 .bashrc
...


➜ ~ ls [^[:digit:]]?*            # 显示当前目录下名字第一个字符不是数字且至少有两位的文件
~~~
