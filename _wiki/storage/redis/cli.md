---
layout: wiki
tags: [命令行]
---



## redis-cli

```shell
# 登录到redis
redis-cli -h localhost -p 6379

# 模糊匹配删除key
redis-cli -h localhost -p 6379 KEYS "pattern" | xargs redis-cli -h localhost -p 6379 DEL
```

## redis-server

```shell
# 开启server
# 开启时同时设置slave，也可以开启后登录server执行slaveof的命令开启
./redis-server ./redis.conf --port 7777 --slaveof 127.0.0.1 6379 &
```