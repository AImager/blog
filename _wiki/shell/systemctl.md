---
title: systemctl
layout: wiki
category: shell
tags: [启动,自启动,service,chkconfig]
---

## 功能描述

systemct是系统服务管理器命令，包含了service和chkconfig的功能


## 实例

~~~Text
# centos默认启动到命令行
systemctl set-default multi-user.target

# centos默认启动到桌面
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

* <http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html>
