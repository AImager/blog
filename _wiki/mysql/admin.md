---
title: admin
layout: wiki
category: mysql
tags: [管理员,权限,导入导出]
---

## 服务启动

~~~Text
# 直接运行模式
$(installLocation)/bin/mysqld

# 安全模式下运行，默认运行模式
$(installLocation)/bin/mysqld_safe
~~~

## 客户端连接

~~~
# 以cli方式登录mysql
mysql -h host -u username -p password
~~~

## 数据导入导出

~~~Text
# dump导出db1里table1和table2的数据
mysqldump -u username -h host -p db1 table1 table2 > dump.sql

# 还原dump的数据
source dump.sql
~~~

## 查看基本信息

~~~
# 查看引擎
show engines;

# 查看版本号
select version(); 
~~~

## 查看服务状态

~~~Text
# 查看数据库执行状态，full用于显示完整sql信息
show full processlist;

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


