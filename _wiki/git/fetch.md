---
title: fetch
layout: wiki
category: git
tags: [拉取,缓存]
---

## 功能描述

将远程分支拉下来到本地分支做缓存，不进入实际的工作区，一般结合merge使用，可以做到比pull更保险

## 实例

```shell
# 拉取远端origin的branch分支数据，到本地的origin/branch分支下
git fetch origin branch
```

### --all

拉取所有remote的所有分支到本地
