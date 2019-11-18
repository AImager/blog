---
layout: wiki
tags: [字符串]
---


## 字符串

```shell
# 设置key以及其值
# O(1)
# EX seconds: 将键的过期时间设置为 seconds 秒
# PX milliseconds: 将键的过期时间设置为 milliseconds 毫秒
# NX|XX ： 只在键不存在|存在时， 才对键进行设置操作
SET key value [EX seconds] [PX milliseconds] [NX|XX]

# 获取key值
# O(1)
get key

# 不存在才设置，不存在返回值为0
# O(1)
setnx key value

# 设置超时秒数和值
# O(1)
setex key seconds value

# 将指定key增加一定数字
# 很适合做统计
# O(1)
incrby key number
```


## 参考链接

* [Redis的内存优化](https://cachecloud.github.io/2017/02/16/Redis%E5%86%85%E5%AD%98%E4%BC%98%E5%8C%96/?hmsr=toutiao.io)