---
title: http
layout: wiki
category: protocol
tags: [应用层,超文本传输]
---


## 协议版本史

* HTTP/1.0: 1996/RFC1945
* HTTP/1.1: 1997/RFC2068--1999/RFC2616--2014/RFC7230~RFC7235
* HTTP/2.0: 2015/RFC7540

## uri、url、urn

uri表示统一资源标识符（identifier），是对资源标识方案的统称。而url和urn就是uri的具体方案，其中url表示统一资源定位符（location），通过`<scheme>://<user>:<password>@<host>:<port>/<path>;<params>?<query>#<frag>`来唯一标识一个资源，是现在的主流方案；而urn表示统一资源名（name），其特点是资源移动后标识名依旧可用，但是由于其复杂性和兼容性，目前还只是试验阶段。

## 请求报文格式

```
GET /media/img/test.png HTTP/1.1
Connection: 请求响应选项
Date: 日期

Host: 主机地址
User-Agent: 发起请求的应用程序名称
Client-IP: 客户端ip
Accept: 可以接受的媒体类型
Accept-Language: 可以接受的语言
Accept-Encoding: 可以接受的编码
If-Modified-Since: 如果指定日期之后资源没有被修改过，则限制这个请求
Authorization: 用于认证的数据
Cookie: cookie数据
Proxy-Connection: 用于使用代理的时候的Connection头
```

## 应答报文格式

```
HTTP/1.1 200 OK
Age: 响应持续时间
Server: 服务器应用程序名称和版本
Set-Cookie: 设置cookie

Content-Encoding: 内容编码
Content-Type: 内容类型
Expires: 绝对超时时间
```

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

## keep-alive

http的keep-alive就是使用一次tcp连接完成多次http通信。http在1.0需要手动设置Connection:keep-alive，1.1改成默认。

tcp的keep-alive指保持tcp连接一段时间，通过系统调用设置程序的socket参数TCPKEEPCNT、TCPKEEPIDLE、TCPKEEPINTVL来完成，对应内核tcp_keepalive_probes、tcp_keepalive_time、tcp_keepalive_intvl参数。

这里需要说明，http的keep-alive时间如果长于tcp的keep-alive时间，那么当tcp断掉后突然要进行http通信，那就新开一个tcp链接。**存疑**

## 代理

使用代理的时候，报文中有以下两个变化

* 第一行的request-url变成了完整的url，这样保证代理作为伪client的时候，依旧可以定位请求的资源。
* header中的Connection变为Proxy-Connection

## 代理与网关

HTTP权威指南中除了代理，还聊到了网关。虽然书中给出了两者的定义，说明了区别，但很多时候两者是混用的，比如网络网关和全局代理的核心功能是一样的，所以我觉得这就是搞技术的在玩概念。但为了交流方便，我们常规上我们还是遵循一些命名原则，比如作为资源获取中间件的时候，我们多数称之为网关，比如短信网关、推送网关、支付网关等；而仅仅是作为流量中转的时候，我们常称之为代理。

除了代理和网关，HTTP权威指南里还提到两个相关概念，即中继和隧道，中继指只做盲转发的代理，而隧道则是通过与网关建立连接来实现和异构协议服务器通信的方式，其实现基于HTTP的CONNECT请求方法。

## 缓存

这里的缓存主要指304缓存，header中常用于控制缓存的是Cache-Control和Expires，但后者不推荐使用，因为其表示的绝对过期时间在终端上并不同步。

## cookie

通过在返回报文头加Set-Cookie来设置cookie，即数据是由服务端填充的，到达客户端后，解析出的cookie以key-value的形式存储在客户端（这里默认为浏览器），随后当再次访问相同域的时候，客户端会将所有对应cookie回传给服务器。

如果加了https，cookie的安全问题主要集中在本地

## session

相比于cookie，session多了服务端标识存储，即每个会话的标识（一般是由server生成的随机串id）会存储在服务端，但目前主流的方案session都是基于cookie的，即session_id会存储在cookie中发送到客户端，然后客户端回传，服务器比对确定会话以及用户。因此session是只关注会话标识的标准，而cookie是一种会话流畅的机制。

session除了基于cookie还可以基于url，即每次回访url上都带上session_id。



## Content-Type

用于描述原始实体主体的类型，所有类型都注册在IANA，常见的主体类型如下

* application/x-www-form-urlencoded
* text/html
* text/plain
* image/gif
* image/jpeg


## 编码

Accept-Language: 

## 参考链接

* HTTP权威指南『2,3,4,5,6,7,8,11,15,16,17』
* HTTP权威指南『9,18,20』
* [HTTP Keep Alive and TCP keep alive](https://stackoverflow.com/questions/9334401/http-keep-alive-and-tcp-keep-alive)
