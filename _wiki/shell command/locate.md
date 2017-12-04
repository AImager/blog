---
title: locate
layout: wiki
category: shell command
tags: [搜索]
---

## 功能描述

通过搜索数据库（系统默认，如MAC下为/var/db/locate.database）进行模糊查找，支持通配符，Linux下有updatedb命令用于更新数据库，OSX下则是单独的脚本（/usr/libexec/locate.updatedb）

## 实例

```
# 搜索路径里带有mysql的文件和目录
locate mysql
```

### -i

忽略大小写

### -r

后面接正则表达式的显示方式，这个MAC不支持

### -d

指定数据库查找