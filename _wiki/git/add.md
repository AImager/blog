---
title: add
layout: wiki
category: git
tags: [添加,暂存区]
---

## 功能描述

从工作区向暂存区添加文件

## 实例

```shell
# 添加所有有变化的文件，包括新建、删除、修改的文件
git add -A

# 解决『cygwin下add中文名文件乱码』
git config --global core.quotepath false

# 添加已经索引并修改或删除的文件
git add -u
```

### -i

交互模式

## 中英对照表

* Working Directory：工作区
* Staging Area：暂存区
* Repository：仓库
