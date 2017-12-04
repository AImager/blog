---
title: mv
layout: wiki
category: shell command
tag: [重命名,移动]
---

## 功能描述

* 移动文件/目录
* 重命名文件/目录

## 实例

```
# 移动文件
mv src/file tar/

# 重命名文件
mv file newfile
```

### -i

若目标文件已存在，提示是否覆盖（养成输入该参数的习惯）

### -u

比较新旧程度（判断是否需要升级）

### -f

强制覆盖
