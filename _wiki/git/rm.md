---
layout: wiki
tags: [删除,暂存区]
---

## 功能描述

执行删除操作

## 实例

```shell
# 删除暂存区内所有对应的工作区已删除文件
git rm --cached $(git ls-files --deleted)

# 删除暂存区shell目录下所有已经add过的文件
git rm --cached $(git ls-files _wiki/shell --stage | awk '{print $4}')
```

### --cached

只删除Staging Area的文件
