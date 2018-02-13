---
title: const
layout: wiki
category: c
tags: [限定符,常量]
---

## const与指针传递类型

* 指向非常量数据的非常量指针：`char *str`
* 指向非常量数据的常量指针：`char *const str`
* 指向常量数据的非常量指针：`const char *str`
* 指向常量数据的常量指针：`const char *const str`