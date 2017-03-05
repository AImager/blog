---
title: symbolic-ref
layout: wiki
category: git
tags: [切换,HEAD,bare]
---

## 功能说明

用于symbolic refs的修改，symbolic refs是HEAD的描述形式『老的HEAD使用linux-link的实现方式，但是跨平台差』

## 实例

~~~Text
# 新建无祖先分支new_branch并切换，同时将当前工作目录的文件全部add到暂存区
# git checkout --orphan可达到相同功能，但是bare仓库不支持checkout命令
git symbolic-ref HEAD refs/heads/new_branch

# 从branch_a切换到已存在分支old_branch，清空old_branch工作目录和暂存区，同时继承branch_a工作目录的文件并全部add
git symbolic-ref HEAD refs/heads/old_branch
~~~

## 参考链接

* <https://git-scm.com/docs/git-symbolic-ref>
