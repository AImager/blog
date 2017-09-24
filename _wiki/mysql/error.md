---
title: error
layout: wiki
category: mysql
tags: [错误,解决方案]
---

## ERROR 1290

* 详细报错: ERROR 1290 (HY000): The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement
* 解决方案: `flush privileges;`

## ERROR 1045

* 详细报错: ERROR 1045 (28000): Access denied for user 'xxx'@'xxx' (using password: XXX)
* 解决方案: 使用--skip-grant-tables启动，然后修改用户密码。