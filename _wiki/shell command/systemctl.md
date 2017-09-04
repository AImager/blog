---
title: systemctl
layout: wiki
category: shell command
tags: [自启动,systemd]
---

## 功能描述

systemctl是systemd初始化系统提供的命令管理工具，包含了sysvinit时代service和chkconfig等命令的功能


## 实例

~~~Text
# 默认启动到命令行
systemctl set-default multi-user.target

# 默认启动到桌面
systemctl set-default graphical.target
~~~

### enable

设置服务自启动

### disable

关闭服务自启动

### start

启动服务

### stop

停止服务

### restart

重启服务

## 参考链接

* [Systemd 入门教程：命令篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)
