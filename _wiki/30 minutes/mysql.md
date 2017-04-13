---
title: mysql
layout: wiki
category: 30 minutes
tags: [mysql]
---

## 服务启动

~~~Text
# 直接运行模式
$(installLocation)/bin/mysqld

# 安全模式下运行，默认运行模式
$(installLocation)/bin/mysqld_safe
~~~


## 服务状态监控

~~~Text
# 查看mysql运行状态
show status;

# 查看数据库执行状态
show processlist;

# 显示配置
show variables;

# 查看所有数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES;

# 查看库数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES where table_schema='database_name';

# 查看表数据大小
select concat(round(sum(DATA_LENGTH/1024/1024),2),'MB') as data from information_schema.TABLES where table_schema='database_name' and table_name='table_name';
~~~


## 权限控制

~~~Text
# 显示当前用户对各数据库的权限
show grants;

# 显示完整用户
SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;

# 创建用户
create user 'yucong'@'%' identified by 'password';

# 修改用户密码
UPDATE user SET password=PASSWORD('password') WHERE user='user_name';

# 授权全部权限
GRANT ALL ON *.* TO 'username'@'%';

# 刷新权限
FLUSH PRIVILEGES;
~~~

## shell命令

~~~Text
# 以cli方式登录mysql
mysql -h host -u username -p password

# dump导出db1里table1和table2的数据
mysqldump -u username -h host -p db1 table1 table2 > dump.sql

# 还原dump的数据
source dump.sql
~~~

## 基础DBA操作

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
