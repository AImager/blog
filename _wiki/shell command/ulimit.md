---
title: ulimit
layout: wiki
category: shell command
tags: [进程,限制]
---

## 功能描述

用户进程的限制参数修改

## 实例

~~~
# 显示所有限制参数及当前值
ulimit -a
~~~

## 显示描述

~~~
-t: cpu time (seconds)              unlimited			# 最长CPU使用时间
-f: file size (blocks)              unlimited			# 文件大小最大值
-d: data seg size (kbytes)          unlimited			# 数据段大小最大值
-s: stack size (kbytes)             8192				# 栈大小最大值
-c: core file size (blocks)         0					# 
-m: resident set size (kbytes)      unlimited			# 物理内存最大值
-u: processes                       3790				# 当前用户最大进程数
-n: file descriptors                1024				# 打开的文件描述符最大值
-l: locked-in-memory size (kbytes)  64					# 锁定内存的最大值
-v: address space (kbytes)          unlimited			# 虚拟内存最大值
-x: file locks                      unlimited			# 文件锁
-i: pending signals                 3790				#
-q: bytes in POSIX msg queues       819200				#
-e: max nice                        0					#
-r: max rt priority                 0					#
~~~
