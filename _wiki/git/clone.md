---
title: clone
layout: wiki
category: git
tags: [克隆项目]
---

## 功能描述

注：对于bare仓库，默认clone的分支为HEAD分支，但是init的bare仓库是没有任何分支的，所以clone下来的也没有任何分支，只不过.git/HEAD默认标识为master

注：github/gitlab上所谓的default分支对应的就是bare仓库里的HEAD分支，如果手动建立bare仓库，修改HEAD/default分支可以通过symbolic-ref命令

## 实例

~~~
# 克隆远程项目到本地，目录命名为new_name，忽略则和远程项目名相同，默认取default分支
git clone url new_name

# 克隆远程项目的branch分支到本地
git clone url -b branch
~~~

### -o

修改默认的远程提交名『默认为origin』
