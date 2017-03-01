---
title: rm
layout: wiki
category: git
tags: [删除,暂存区]
---

## 功能描述

执行删除操作

## 实例

~~~
git rm --cached $(git ls-files --deleted)		//删除暂存去内所有对应的工作目录已删除文件
git rm --cached $(git ls-files _wiki/shell --stage | awk '{print $4}')		//删除暂存区shell目录下所有已经add过的文件
~~~

### --cached

只删除Staging Area的文件
