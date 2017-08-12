---
title: dns
layout: wiki
category: protocol
tags: [应用层,域名]
---


## www

www并不是必须的，www.example.com实际上和abc.example.com一样只是个普通的二级域名。之所以它很常见是因为旧时代加了www可以引起人注意，让别人知道这是个网址，但现在web的覆盖率显然不需要做这件事了。那除了知名度，还有哪些可以让我们保留www的理由呢？我想最重要的应该就是cookie域的问题，裸域名的域范围太大，安全和可控性都是问题，所以在cookie相当重要的今天，仅此一条就大大提高了www的话语权，而其它类似健壮域名、seo（这个貌似是谣传）等问题其实无伤大雅。因此，结合裸域名的简明优势，目前的一个最佳方案是301重定向裸域名到www域名。


## 参考链接

* [WHY USE WWW?](http://www.yes-www.org/why-use-www/)
* [为什么越来越多的网站域名不加www前缀？](https://www.zhihu.com/question/20414602)