---
title: remote
layout: wiki
category: git
tags: [远程,仓库]
---

## 功能描述

远程仓库相关功能，要注意的是，remote只是修改本地和remote有关的配置，但不能直接影响到远程仓库的配置。

## 实例

```
# 建立仓库，不可本地修改
# 类似github的后台服务
git init --bare example.git

# 提交分支到远程，local_branch默认为当前分支
git push origin [local_branch:]remote_branch

# 这里只是修改本地的origin/HEAD，让其指向origin/gh-pages分支，并没有改变远程origin的head
git remote set-head origin gh-pages
```


### -v

列出已存在远程分支的shortname和对应url

### add origin url

添加远程仓库

### show origin

显示远程仓库origin的信息

### rm origin

删除远程仓库

### rename origin new_origin

重命名远程仓库标识名
