---
title: query
layout: wiki
category: mysql
tags: [查询]
---

```
# 切换当前数据库
use mysql_name;

# 显示所有当前用户可使用的数据库
show databases;

# 显示当前数据库中的表
show tables;

# 创建数据库
create database database_name;

# 删除数据库
drop database database_name;

# 查看DDL
show create table table_name;
```

## query

```
# 执行SQL时不使用用cache
# 但如果结果不变则还是返回结果集cache
select SQL_NO_CACHE * from table;

# 强制索引，位置在该索引所在表名后，on和where子句前
select * from table FORCE INDEX (index_name) where a = 1;
```


## 函数

```
# 日期格式化/转换为时间戳/从时间戳转换
DATE_FORMAT(NOW(), '%Y-%m-%d'), UNIX_TIMESTAMP(NOW()), FROM_UNIXTIME(1355272360, '%Y-%m-%d')
```

