---
title: run
layout: wiki
category: docker
tags: [运行,镜像]
---


## 实例

~~~Text
# 后台执行mongo镜像
docker run -d mongo
~~~

### -i/--interactive

开启标准输入

### -t/--tty

分配一个终端窗口

### --name

指定启动后的容器名

### -d

后台执行

### -p in_port:out_port

指定端口映射

### -v in_dir:out_dir

指定volume映射

### -name

设置运行容器名称

### --link name:name

用来连接两个容器
