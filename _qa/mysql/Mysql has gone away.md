---
title: Mysql has gone away
layout: qa
tags: []
---

## Mysql has gone away

* 可能原因: 连接长时间没有新的请求，超过了wait_timeout
* 解决方案: 调大`wait_timeout`，即不活跃的连接超时时间