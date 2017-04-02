---
title: checkout
layout: wiki
category: git
tags: [分支,切换,新建,合并,清除]
---

## 功能描述

切换分支，切换后工作区和暂存区的修改会保留

## 实例

~~~Text
# 默认用法，切换到branch分支
git checkout branch

# 基于其它分支新建local_branch分支
git checkout -b [local_branch] [remotename]/[remote_branch]

# 新建无祖先分支branch并切换到该分支
git checkout --orphan branch

# 清除未索引的文件修改
git checkout file_name

# 清除所有未索引的文件修改
git checkout -- .

# 将sd3f6的file1和file2文件内容应用到当前分支，呈现uncommit状态
git checkout sd3f6 -- file1 file2
~~~


### -b

新建分支并切换到新分支，分支默认来源当前分支

### -B

新建分支并切换到新分支，如果分支已存在，就初始化该分支为新分支

### --orphan

新建初始化分支，此分支没有任何祖先
