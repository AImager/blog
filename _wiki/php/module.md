---
title: module
layout: wiki
category: php
tags: [模块化]
---


## include/require

* include是用到的时候加载，若加载出错不会停止执行，只会返回个错误提示
* require是一开始就加载，若加载出错停止执行，返回错误

## 查看编译的二进制模块信息

* `php --ri module_name`