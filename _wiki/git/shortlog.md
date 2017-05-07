---
title: shortlog
layout: wiki
category: git
tags: [短记录]
---

## 功能描述

查看commit记录，功能同git log，只是默认以short的方式显示，不同方式的默认显示都可以在config中配置

## 实例

~~~Text
# 查看信息，格式化成『时间 短提交hash 提交者 提交信息』显示
git shortlog --format=format:'%ci    %h    %cN    %s'
~~~

## 参考链接

* [git-log](https://git-scm.com/docs/git-log)
