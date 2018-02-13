---
title: cannot lock ref
layout: qa
---

## cannot lock ref

* 背景:
    * `git pull origin some_branch`报错
* 详细报错: error: cannot lock ref XXX cannot create XXX
* 可能原因:
    * 远程分支被删除了
    * 远程分支被`push --force`了，导致与本地分支存在冲突
* 解决方案: 如果冲突了`git pull -p`