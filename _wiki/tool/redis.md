---
title: redis
layout: wiki
category: tool
tags: [缓存,消息队列]
---

## 安装

```
# 源码安装
make -j 8 && sudo make PREFIX=/server/environ/originlib/redis-3.2.3 -j 8 install
```

## config

redis默认config需要下载，稳定最新版[地址](http://download.redis.io/redis-stable/redis.conf)。config也是采用命令的形式，即加载配置实际上是执行命令。

```
# 设置64个库
# 库名索引为0~63
databases 64
```

## redis-cli

```
# 登录到redis
redis-cli -h localhost -p 6379

# 模糊匹配删除key
redis-cli KEYS "pattern" | xargs redis-cli DEL
```

## redis-server

```
# 开启server
./redis-server --port 7777 --slaveof 127.0.0.1 6379
```

## 通用命令

```
# 验证帐号
auth password

# 切换数据库
select db

# 匹配搜索后缀为_name的key
keys *_name

# 获取key的超时时间
ttl key

# 对列表、集合、有序集合排序
sort key
```

## 字符串

```
# 设置key以及其值
set key value

# 获取key值
get key

# 不存在才设置，不存在返回值为0
setnx key value

# 设置超时秒数和值
setex key seconds value

# 将指定key增加一定数字
# 很适合做统计
incrby key number
```

## 哈希

哈希更节省内存，而且其结构对单一key而言类似于关联数组，所以很适合用户信息这样的场景。

```
# 设置key的field字段值
hset key field value

# 获取key的field字段值
hget key field
```


## 列表

```
# 加入列表
lpush key value

# 删除并获取第一个值，栈的形式
lpop key

# 根据索引取出数据
lrange key start end
```

## 集合

字符串类型的无序集合，集合成员是唯一的。

```
# 将成员添加到集合
sadd key member
```

## 有序集合

字符串类型的有序集合，集合成员是唯一的。每个元素关联一个分数，通过分数排序。

```
# 将成员和其分数添加进集合
zadd key score member

# 获取集合成员数量
zcard key

# 按分数从小到大获取指定未知区间的成员
# 加WITHSCORES表示显示分数
zrange key start end [WITHSCORES]

# 按分数从大到小获取指定未知区间的成员
# 加WITHSCORES表示显示分数
zrevrange key start end [WITHSCORES]

# 在现有基础上增加分数
zincrby key increment member
```

## HyperLogLog

用于做模糊`count(distinct)`的结构，速度快，内存占用小。

```
# 添加元素进去
pfadd key element

# 统计数量
pfcount key
```

## 发布订阅

用于简单消息队列的发布订阅。

## 备份

redis提供了两种备份选项，分别是RDB和AOF。

### RDB

redis默认启用该备份方式，默认配置为`save 60 10000`，表示60秒检查一次备份，如果变化数据超过10000条，就备份到二进制文件dump.rdb，这种策略被称为快照。

可手动调用save命令进行立即备份，bgsave立即后台备份。

### AOF

RDB一般是进行慢备份，所以可以通过`appendonly yes`开启AOF备份，其刷新规则主要有`appendfsync always`和`appendfsync everysec`两种，前者是只要有变化就刷新到硬盘，后者是一秒刷新一次。

可手动调用bgrewriteaof进行立即AOF备份。



## 集群方案

* 做sharding，即通过对key进行hash选定实例进行存取，典型的应用为java中的ShardedJedis。好处是不用引入中间件。坏处是需要程序员小心控制key，以保证不会出现负载不均衡。
* Redis Cluster，redis官方的集群方案，不需要引入中间件，没有所谓的主从逻辑，完全由各实例相互间的通信来完成数据共享。
* 代理，典型的应用有codis和Twemproxy
