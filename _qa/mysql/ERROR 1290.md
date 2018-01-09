---
title: ERROR 1290
layout: qa
category: mysql
---

## ERROR 1290

* 详细报错: ERROR 1290 (HY000): The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement
* 解决方案: `flush privileges;`