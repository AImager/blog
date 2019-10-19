---
title: 从cgi谈起
layout: post
tags: [fastcgi,servlet]
---

稍微了解过万维网的历史就会知道，最初的网页全是静态页面，那么对当时而言，一个web server就能撑起整个后端。但当我们需要更动态的响应用户请求时，web server调用应用程序生成html就成了一个直观的解决方案，当两类程序需要沟通，且这个沟通很常见的时候，标准组织就介入了，而这也就是cgi诞生的背景。

## cgi

cgi是个协议，这个

> A named parameter which carries information from the server to the script.  It is not necessarily a variable in the operating system's environment, although that is the most common implementation.

## fastcgi

fastcgi，从名字就可以看出来，这是为了解决cgi性能问题而诞生的扩展版cgi。导致cgi性能低的最大原因是cgi（1.1的常规实现）会在每次请求进来的时候均进行fork-exit操作，那么fastcgi最基本的设计原则就是支持常驻进程（参考以下对fastcgi的总结描述 [^spec]）

> FastCGI is designed to support long-lived application processes, i.e. application servers. That's a major difference compared with conventional Unix implementations of CGI/1.1, which construct an application process, use it respond to one request, and have it exit.

## servlet

进行

## 参考链接

* [RFC3875 CGI](https://www.rfc-editor.org/info/rfc3875)
* [FastCGI](http://www.php-internals.com/book/?p=chapt02/02-02-03-fastcgi)
* [Cgi Vs Servlet](http://wiki.c2.com/?CgiVsServlet)

## 引用

[^spec]: [FastCGI Specification](https://web.archive.org/web/20160119141816/http://www.fastcgi.com/drupal/node/6?q=node%2F22#S1)