---
title: symbolic-ref
layout: wiki
category: git
tags: [切换,HEAD,bare]
---

## 功能说明

用于symbolic refs的修改『即.git/HEAD』，symbolic refs是HEAD的描述形式『老的HEAD使用link的实现方式，但是跨平台差』

## 实例

~~~
# 修改.git/HEAD，但此时并不会在refs/heads中新建文件，直到有commit提交，该分支才算真正意义上的建立，且该分支无祖先
# git checkout --orphan可达到相同功能，但是bare仓库不支持checkout命令
git symbolic-ref HEAD refs/heads/new_branch

# 切换HEAD到old_branch分支
git symbolic-ref HEAD refs/heads/old_branch
~~~

## 参考链接

* [git-symbolic-ref](https://git-scm.com/docs/git-symbolic-ref)
