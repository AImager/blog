---
title: init
layout: wiki
category: unix-like
tags: [启动]
---

## shell交互方式

* 交互登陆shell（登录的时候），bash执行时先执行/etc/profile文件夹，再执行~/.bash_profile、~/.bash_login和~/.profile中从左往右第一个找到的可读文件，结束时执行~/.bash_logout文件
* 交互非登陆式shell（登录后开启新的shell），此时bash启动只执行~/.bashrc（修改的重要文件），所以我们修改一般只修改这个文件（修改环境变量、命令等）
* 非交互式shell（执行shell脚本的时候），bash执行时继承了对应交互式的配置文件

## 参考链接

* [走进Linux之systemd启动过程](https://linux.cn/article-5457-1.html)
* [浅析Linux初始化系统——systemd](https://www.ibm.com/developerworks/cn/linux/1407_liuming_init3/)
* [浅析Linux初始化系统——sysvinit](https://www.ibm.com/developerworks/cn/linux/1407_liuming_init1/index.html)
* [最简明扼要的Systemd教程](http://blog.jobbole.com/97248/)