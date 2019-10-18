---
layout: wiki
tags: [状态码]
---


## 常见状态码

* 200 Ok：正确返回
* 304 Not Modified：请求资源未修改
* 400 Bad Request：错误请求
* 403 Forbidden：请求被拒绝
* 404 Not Found：无法找到所请求的资源
* 408 Request Timeout：请求超时
* 500 Internal Server Error：服务器错误
* 502 Bad Gateway：后端服务出现伪响应（比如nginx连接php-fpm失败）的时候返回
* 503 Service Unavailable：服务不可用
* 504 Gateway Timeout：服务请求超时，类似408，但主要是后端服务的超时（比如nginx链接php-fpm超时）