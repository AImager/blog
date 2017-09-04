---
title: apt-cache
layout: wiki
category: shell command
tags: [deb,ubuntu,正则]
---

## 实例

~~~Bash
# 正则匹配搜索package，搜索范围只限名字
sudo apt-cache search --names-only "php{2}"
~~~

### depends

查看包依赖哪些包

### rdepends

查看包被哪些包依赖

### show

查看包相关信息

### search

查找包（模糊查找）
