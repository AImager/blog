---
title: diff
layout: wiki
category: git
tags: [比较]
---

## 实例

```shell
# 比较工作区和暂存区都存在的文件的区别
git diff

# 比较工作区和本地仓库都存在的文件的区别
git diff HEAD
```

### --staged

比较暂存区和本地仓库的区别

### -G

正则搜索修改行

### --name-only

只显示有差别的文件名
