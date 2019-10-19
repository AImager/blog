---
title: ERROR 1045
layout: qa
tags: []
---

## ERROR 1045

* 详细报错: ERROR 1045 (28000): Access denied for user 'xxx'@'xxx' (using password: XXX)
* 解决方案: 使用--skip-grant-tables启动，然后修改用户密码。