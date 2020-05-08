---
layout: wiki
tags: [性能测试]
---


```shell
-h <hostname>
服务器的主机名（默认值为127.0.0.1）。

-p <port>
服务器的端口号（默认值为6379）。

-s <socket>
服务器的套接字（会覆盖主机名和端口号）。

-a <password>
登录Redis时进行身份验证的密码。

-c <clients>
并发的连接数量（默认值为50）。

-n <requests>
发出的请求总数（默认值为100000）。

-d <size>
SET/GET命令所操作的值的数据大小，以字节为单位（默认值为2）。
```