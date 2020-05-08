---
layout: wiki
tags: [事务]
---

通过MULTI、EXEC、WATCH等命令来实现事务

```shell
redis> MULTI
OK

redis> SET key1 string1
QUEUED

redis> GET key1
QUEUED

redis> SET key2 string2
QUEUED

redis> GET key2
QUEUED

redis> EXEC
OK
string1
OK
string2
```

每个redis客户端（注意这里指的是redis服务的客户端标识结构，即`typedef struct client`，原来叫redisClient）都会维护自己的事务状态。MULTI开始事务，EXEC提交事务，中间的命令提交后都不会返回数据，而是被插入到mstate里面，直到EXEC提交后会一起顺序执行（如何保证原子性？），执行完后数据一起返回。


```c
typedef struct client {
    ...
    multiState mstate;
    ...
}
```