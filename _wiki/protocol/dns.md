---
title: dns
layout: wiki
category: protocol
tags: [应用层,域名]
---


## www

www并不是必须的，www.example.com实际上和abc.example.com一样只是个普通的二级域名。之所以它很常见是因为旧时代加了www可以引起人注意，让别人知道这是个网址，但现在web的覆盖率显然不需要做这件事了。那除了知名度，还有哪些可以让我们保留www的理由呢？我想最重要的应该就是cookie域的问题，裸域名的域范围太大，安全和可控性都是问题，所以在cookie相当重要的今天，仅此一条就大大提高了www的话语权，而其它类似健壮域名、seo（这个貌似是谣传）等问题其实无伤大雅。因此，结合裸域名的简明优势，目前的一个最佳方案是301重定向裸域名到www域名。


## 域名记录类型


* A: 主要DNS记录，将域名指向IP
* AAAA: 指向IPv6
* CNAME: 为A记录设置别名，类似于转发，但只转发到域名级别
* URL Redirect: URL显示转发，相比于CNAME只转发到域名，URL Redirect可转发到详细的URL，转发后显示转发的地址
* URL Frame: URL隐式转发，转发后显示域名地址
* MX: 设置域名邮件转发的服务器，比如使用QQ企业邮箱，@后一般是公司自己的域名，通过设置MX记录将其转发到腾讯指定的服务器地址上，就实现了由腾讯代收邮件的过程。
* NS: 设置用于传递DNS信息的服务器地址，至少设置两条



## 参考链接

* [WHY USE WWW?](http://www.yes-www.org/why-use-www/)
* [为什么越来越多的网站域名不加www前缀？](https://www.zhihu.com/question/20414602)