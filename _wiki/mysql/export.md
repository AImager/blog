---
title: export
layout: wiki
category: mysql
tags: [导入导出]
---


## 数据导入导出

~~~
# dump导出db1里table1和table2的数据
mysqldump -u username -h host -p db1 table1 table2 > dump.sql

# 还原dump的数据
source dump.sql
~~~