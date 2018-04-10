---
title: branch
layout: wiki
category: git
tags: [分支]
---

## 功能描述

分支操作

## 实例

```
# 新建new_branch，存在则报错
git branch new_branch

# 显示所有分支，HEAD分支前有*标识
git branch -a

# 重命名分支
git branch -m old_name new_name
```

### -d

删除分支，如果分支上存在未合并的分支，提示错误

### -D

不合并分支的前提下删除branch分支

### -a

显示所有分支，包括远程分支

### -m

修改分支名

### --set-upstream-to

设置本地与远程的分支绑定，可用于默认的pull
