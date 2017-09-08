---
title: memcached
layout: wiki
category: tool
tags: [缓存]
---

memcached是一个高性能key-value内存型数据库，因为没有持久换存储功能，所以只适合做缓存。相比于redis，只支持字符串的数据结构，但小数据多读的场景下内存利用效率和速率要略高于redis。

## 应用命令

~~~
# key不存在就设置，存在就更新
# exptime表示超时秒数，0表示无限
# bytes表示存储所用bytes数量
# noreply表示不返回值
# flags为4bytes的额外存储，不过还没搞清楚它干嘛用的，一般就设置为0
set key flags exptime bytes [noreply] value 

# key不存在就设置，存在不更新且返回NOT_STORED
add key flags exptime bytes [noreply] value

# key存在就更新，不存在返回NOT_STORED
replace key flags exptime bytes [noreply] value

# 在对应key的value后面追加值
append key flags exptime bytes [noreply] value

# 获取值
get key

# 删除值
delete key [noreply]

# 在指定key的value基础上增加值
incr key increment_value

# 在指定key的value基础上减少值
decr key increment_value
~~~

## 运维命令

~~~
# 清理所有值
flush_all

# 查看当前memcached的状态
stat
~~~


## 集群

* Twemproxy: 用于memcached多节点的代理
* MemcacheDB: 用于memcached持久化的数据库

## 参考链接

* [memcached_set](http://docs.libmemcached.org/memcached_set.html)