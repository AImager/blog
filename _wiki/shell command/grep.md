---
title: grep
layout: wiki
category: shell command
tags: [搜索,正则,通配符]
---

## 功能描述

在流中搜索信息

## 实例

```shell
# 在当前目录下递归查找文件里的new关键字，排除后缀为md和目录含_site的文件
grep -nr "new" ./ --exclude-dir=_site --exclude="*.md"

# 寻找不含有20012004、20014001且含有WARN的行
grep -v -E "20012004|20014001" file | grep --color 'WARN'
```

### -v

搜索非匹配行

### -n

显示行号

### -c

仅显示匹配行

### -r

查找子目录

### -o

仅显示匹配到的字符串

### --exclude=

排除匹配模式的文件，通配符匹配

### --include=

包含匹配模式的文件，通配符匹配

### --color

高亮匹配的字符

### -E

使用扩展正则表达式

### -C

显示上下多少行

### -A

显示后几行

### -B

显示前几行

### -m 1

只显示第1个匹配