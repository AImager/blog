---
title: lsof
layout: wiki
category: shell command
tags: [文件句柄,查看]
---

## 常规实现

遍历/proc下各进程目录的fd文件夹，会调用opendir、readdir、stat系统调用。

## 实例

```
# 查看所有打开文件及相应进程
lsof
```