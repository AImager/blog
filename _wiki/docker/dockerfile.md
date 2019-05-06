---
title: dockerfile
layout: wiki
category: docker
tag: [镜像]
---

* RUN 指令不会保存上一条指令的工作路径，每条 RUN 指令都只会将工作目录指定为 / 目录
* 一条 Dockerfile 中的指令就会产生一次镜像的提交。
* 每次提交都会产生一个文件
* 某条命令添加文件A，其它的命令删除A不会减少镜像的大小，必须在同一命令删除


## 实例


```shell
# 不使用缓存构建aimager/php-nginx:7.2.0-1.13.7
# 使用当前目录的dockerfile文件
docker build -t aimager/php-nginx:7.2.0-1.13.7 . --no-cache
```

### --no-cache

不使用缓存构建

### --virtual

