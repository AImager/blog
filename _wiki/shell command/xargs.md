---
title: xargs
layout: wiki
category: shell command
tags: [参数分割]
---

## 功能描述

将串分割后作为参数传递给命令，避免单次命令超过shell下的最大长度

## 实例

~~~Text
# 寻找path下文件进行删除
find /path -type f -print0 | xargs -0 rm
~~~