---
title: nohup
layout: wiki
category: shell command
tags: [守护进程]
---

## 功能描述

让命令进程忽略挂断信号；将命令进程的stdin关闭，同时将命令进程的stdout和stderr重定向到nohup.out文件。

## 实例

```
# 后台执行cli.php，重定向标准输出到cli.log
nohup php cli.php & > cli.log
```

## 参考链接

* [Linux守护进程的启动方法](http://www.ruanyifeng.com/blog/2016/02/linux-daemon.html)