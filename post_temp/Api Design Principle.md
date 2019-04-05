---
title: 接口设计原则
layout: post
tag: []
---

### 写接口需不需要返回数据

需要做幂等的接口不返回，尽量不要

### 接口何时需要做幂等

分两种情况

1. 异常网络导致的重试，此时多次请求数据完全一样，
2. 多次主动请求

## 领域接口设计

* 信息流预留本版本不支持的类型

## 版本控制

* [APP接口多版本处理](https://www.fanhaobai.com/2017/08/api-version.html)
