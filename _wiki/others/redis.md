---
title: redis
layout: wiki
category: others
tags: [缓存]
---

## 安装

~~~Text
# 源码安装
make -j 8 && sudo make PREFIX=/server/environ/originlib/redis-3.2.3 -j 8 install
~~~

## shell命令

~~~Text
# 登录到redis
redis-cli -h localhost -p 6379

# 模糊匹配删除key
redis-cli KEYS "pattern" | xargs redis-cli DEL
~~~

## 基础命令

~~~
# 验证帐号
auth password

# 切换数据库
select db

# 设置key缓存
set key value

# 获取key值
get key

# 匹配搜索后缀为_name的key
KEYS *_name

# 根据索引取出数据
lrange key start end
~~~
