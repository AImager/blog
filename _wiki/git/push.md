---
title: push
layout: wiki
category: git
tags: [远程,分支]
---

## 功能描述

## 实例

~~~Bash
# 提交本地分支到远程
git push origin [branch_local:]branch_remote

# 删除远程的master分支
git push origin --delete master

# 删除远程tag
git push origin --delete tag tagname
~~~

### -f

强制提交

### --delete

删除分支
