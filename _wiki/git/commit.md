---
title: commit
layout: wiki
category: git
tags: [提交]
---

## 功能描述

添加记录（将暂存区的信息提交到本地仓库）

## 实例

~~~
# 提交所有暂存区的文件，进入commit文件编辑模式
git commit

# 只提交test/test文件，修改日期，采用简短msg模式
git commit --date="2012-12-12" -o test/test -m "commit_msg"
~~~

### -a

将工作区修改或删除且已添加到暂存区的文件提交到本地仓库，不过新文件不提交

### -o

指定需要commit的文件

### -m "msg"

将本次提交的信息命名为msg

### --date

设置提交时的日期，只是author时间，不影响commit时间线
