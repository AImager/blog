---
title: reset
layout: wiki
category: git
tags: [回退]
---

## 实例

```shell
# unstaged file
# 即将添加到暂存区的修改回退
# 但工作目录的修改还是保留
git reset HEAD -- file
```

### --hard commit_id

所有信息回退到commit_id级别，commit_id是提交的commit的哈希值

### --soft commit_id

保留工作区源码和暂存区信息，但回退本地仓库到commit_id级别

### --mixed commit_id/file_name

不加参数的默认版本，保留工作区源码，但回退暂存区和本地仓库到commit_id级别

### HEAD file_name

回退暂存区
