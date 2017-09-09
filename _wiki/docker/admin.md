---
title: admin
layout: wiki
category: docker
tag: [管理员]
---


## exec

~~~Text
# 进入容器781，采取交互方式运行bash
docker exec -it 781 /bin/bash
~~~

* -i: 交互模式* -t: 创建tty


## images

~~~
# 查看所有镜像
docker images
~~~


## ps

~~~
# 查看当前运行的容器
docker ps

# 查看所有容器
docker ps -a
~~~


## run

~~~Text
# 后台执行mongo镜像
docker run -d mongo
~~~

* -i/--interactive: 开启标准输入
* -t/--tty: 分配一个终端窗口
* --name: 指定启动后的容器名
* -d: 后台执行
* -p in_port:out_port: 指定端口映射
* -v in_dir:out_dir: 指定volume映射
* -name: 设置运行容器名称
* --link name:name: 用来连接两个容器
* -m: 限制内存使用
* --memory-swap: 限制swap内存使用
* --cpu-shares: 设置CPU利用率权重，权重/权重和就是某个容器所能占用的CPU比率
* --cpuset-cpus: 设置容器绑定CPU执行
* --cpu-period: 设置CPU重新分配给容器使用的时长
* --cpu-quota: 在分配时长这个周期内，最多可以使用多长时间来运行容器


## stat

~~~Text
# 查看容器的CPU、内存、IO状态
docker stats 512
~~~


## search

~~~
# 查找images
docker search images
~~~

## pull

~~~
# 拉取images
docker pull images[:tag]
~~~

