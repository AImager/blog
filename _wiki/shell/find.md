---
layout: wiki
tags: [搜索,通配符,正则]
---

## 功能描述

搜索

## 实例

```shell
# 寻找普通的c语言文件
find /path -type f -name '*.c'

# 不区分大小写
find /path -iname '*pattern*'

# 正则寻找文件
find /path -regex '^[^_].*.c'
```

### -name

按名字查找

### -perm

按权限查找

### -user

按用户查找

### -type

按文件类型查找，主要有以下几种类型

b: 文件类型块设备
d: 目录
c: 字符设备
p: 管道
l: 符号链接
f: 普通文件

### -regex

按正则方式匹配搜索

### -samefile

寻找链接到指定文件的文件