---
title: checkout
layout: wiki
category: git
tags: [切换分支]
---

## 实例

~~~Text
# 默认用法，切换到branch分支
git checkout branch

# 从远程拉下remote_branch到本地新建的local_branch分支
git checkout -b [local_branch] [remotename]/[remote_branch]

# 新建init分支branch并切换到该分支，切换后所有工作目录的文件都为add状态
git checkout --orphan branch
~~~


### -b

新建分支并切换到新分支，分支默认来源当前分支

### -B

新建分支并切换到新分支，如果分支已存在，就初始化该分支为新分支

### --orphan

新建初始化分支，此分支没有任何祖先
