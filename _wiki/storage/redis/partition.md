---
layout: wiki
tags: [备份,分区,AOF]
---


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


## 参考链接

* [简单高可用redis架构实践](http://cuihuan.net/2017/02/05/redis3/)
* [Redis Sentinel机制与用法](https://segmentfault.com/a/1190000002680804)