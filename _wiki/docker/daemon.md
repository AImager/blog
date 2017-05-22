---
title: daemon
layout: wiki
category: docker
tags: [启动]
---

## 实例

~~~
# docker启动
/usr/bin/docker daemon \
    -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock \
    -g /server/data/docker \
    --storage-opt dm.fs=xfs \
    --cluster-store=consul://192.168.101.55:8500 \
    --cluster-advertise=192.168.101.55:0 \
    --insecure-registry xx.xx.xx
~~~
