---
title: branch
layout: wiki
category: git
tags: [分支]
---

## 功能描述

分支操作

## 实例

~~~Text
git branch new_branch		//新建new_branch，存在则报错
git branch			//显示所有分支，HEAD分支前有*标识
~~~

### -d

删除分支，如果分支上存在未合并的分支，提示错误

### -D

不合并分支的前提下删除branch分支
