---
title: config
layout: wiki
category: git
tags: [配置]
---

## 功能描述

设置信息

## 文件配置

```shell
# 配置用户
[user]
	name = xiaoronglv
	email = xxxxx@gmail.com
[core]
    # 配置全局ignore文件
	excludesfile = ~/.git/.gitignore_global
```

## 实例

```
# 修改用户名为AImager
git config --local user.name AImager
```

### --local

修饰符，指定设置当前项目，默认选项，设置保存在当前项目.git/config文件中

### --global

修饰符，指定设置当前账户，设置的信息一般存储在当前用户目录的.gitconfig文件

### --system

修饰符，指定设置全局账户，设置的信息一般存储在/etc/gitconfig文件中

### -l

显示所有当前目录的config信息

## 常用属性键

```
user.name：用户名称
user.email：用户邮箱
```
