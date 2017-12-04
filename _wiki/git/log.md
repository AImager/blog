---
title: log
layout: wiki
category: git
tags: [查看记录]
---

## 功能描述

查看commit记录

## 实例

```
# 查看feature分支有但是master分支没有的commit信息
git log master..feature

# 查看文件的修改记录
git log --pretty=oneline file
```

### --stat

包含文件变更记录

### --format

格式化信息显示

### --graph

图像形式显示

### --pretty=oneline

选定什么格式显示，包括oneline\short\full\fuller等
