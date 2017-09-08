---
title: ab
layout: wiki
category: shell command
tags: [压测]
---

* 并发数: 表示同一时间与服务器通信的客户端数量
* 并发连接数: 表示同一时间与服务器连接的客户端数量
* QPS: 每秒请求量
* MAU: 月活用户数
* WAU: 周活用户数
* DAU: 日活用户数
* PV: 日访问页面数
* UV: 日访问用户数，不必纠结和DAU的区别
* TTLB: 请求响应时间
* TPS: 每秒事务处理量

## 实例

~~~
# 开启10并发，共提交100个请求
# 相当于平均一个连接提交10个请求
ab -n 100 -c 10 http://aimager.com/
~~~

## 显示说明

~~~
# 并发数
Concurrency Level: 100		

# 整个测试持续的时间
Time taken for tests: 50.872 seconds

# 完成的请求数
Complete requests: 1000

# 失败的请求数
Failed requests: 0

# 整个场景中的网络传输量
Total transferred: 13701482 bytes

# 整个场景中的HTML内容传输量
HTML transferred: 13197000 bytes

# QPS
Requests per second: 19.66 [#/sec] (mean)

# 请求响应时间
Time per request: 5087.180 [ms] (mean)

# 请求处理时间
Time per request: 50.872 [ms] (mean, across all concurrent requests)
~~~

## 坑

* url后面即使是根目录也必须有/，不能省略