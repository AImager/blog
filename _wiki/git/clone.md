---
title: clone
layout: wiki
category: git
tags: [克隆项目]
---

## 实例

~~~
# 克隆远程项目到本地，目录命名为new_name，忽略则和远程项目名相同，默认取default分支
git clone url new_name

# 克隆远程项目的branch分支到本地
git clone url -b branch
~~~

### -o

修改默认的远程提交名『默认为origin』
