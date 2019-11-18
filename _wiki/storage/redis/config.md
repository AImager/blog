---
layout: wiki
tags: [配置]
---


## config

redis默认config需要下载，稳定最新版[地址](http://download.redis.io/redis-stable/redis.conf)。config也是采用命令的形式，即加载配置实际上是执行命令。

```shell
# 设置64个库
# 库名索引为0~63
databases 64
```