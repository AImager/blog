---
title: query
layout: wiki
category: mysql
tags: [查询,优化,profiler,explain]
---

## scheme

~~~Text
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
~~~

## query

~~~Text
# 执行SQL时不使用用cache，位置在SELECT后
# 但如果结果不变则还是返回结果集cache
SQL_NO_CACHE

# 强制索引，位置在该索引所在表名后，on和where子句前
FORCE INDEX (index_name)

# 日期格式化/转换为时间戳/从时间戳转换
DATE_FORMAT(NOW(), '%Y-%m-%d'), UNIX_TIMESTAMP(NOW()), FROM_UNIXTIME(1355272360, '%Y-%m-%d')
~~~

## profiler分析

~~~Text
# 开启sql分析
SET profiling = 1;

# 查看profiling的设置状态
SELECT @@profiling;

# 查看所有已经分析了的query
SHOW PROFILES;

# 查看query序号为4的数据
SHOW PROFILE ALL FOR QUERY 4;
~~~


## trace分析

~~~
# 设置开启trace
SET OPTIMIZER_TRACE="enabled=on";
# 设置最大optimizer内存
SET OPTIMIZER_TRACE_MAX_MEM_SIZE=1000000;
# 设置记录的sql数
SET optimizer_trace_limit = 1;

# 设置完成并运行sql后，执行得到trace字段
# trace字段为json格式的详细trace分析
select TRACE from information_schema.OPTIMIZER_TRACE;
~~~