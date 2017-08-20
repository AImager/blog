---
title: iterator
layout: wiki
category: design patterns
tags: [迭代器,行为型,模式]
---

对外隐藏内部的组织结构并提供通用的访问方法。很多语言都包含迭代器实现的组件，比如C++的STL，PHP的一些SPL模块。PHP还包含默认的迭代器类Iterator。

当多个结构需要采用同样的算法访问的时候，迭代器的优势就体现出来了，STL的出现就是为了抽象隔离结构与算法。

实现太简单，不写了。