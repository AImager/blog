---
title: mysql
layout: wiki
category: others
tags: [mysql,关系型数据库]
---

## 安装

~~~Text
# 源码安装
cmake . -DCMAKE_INSTALL_PREFIX=/install_path/mysql-x.x.xx \
-DDOWNLOAD_BOOST=1  \
-DMYSQL_DATADIR=/data_path/mysql \
-DMYSQL_UNIX_ADDR=/dev/shm/mysql.sock \
-DSYSCONFDIR=/install_path/etc/mysql \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_EXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_EXTRA_CHARSETS:STRING=all \
-DMYSQL_TCP_PORT=3306 \
-DWITH_DEBUG=0 && make -j 8 && sudo make -j 8 install
~~~


## 服务启动

~~~Text
# 直接运行模式
$(installLocation)/bin/mysqld

# 安全模式下运行，默认运行模式
$(installLocation)/bin/mysqld_safe
~~~

## docker-compose

~~~Text
version: '2'

services:
  mysql:
    image: mysql:latest
    container_name: mysql
    volumes:
      - "/server/tmp_data/mysql:/var/lib/mysql"
      - "/server/etc/mysql:/etc/mysql/conf.d"
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=password
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

## no query

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
# 执行SQL时不适用cache，位置在SELECT后
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
SET OPTIMIZER_TRACE="enabled=on";
SET END_MARKERS_IN_JSON=on;
SET OPTIMIZER_TRACE_MAX_MEM_SIZE=1000000;
SET optimizer_trace_limit = 1;

main sql;

select TRACE from information_schema.OPTIMIZER_TRACE;
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


## 服务状态监控

~~~Text
# 查看mysql运行状态
show status;

# 查看数据库执行状态，full用于显示完整sql信息
show full processlist;

# 查看所有数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES;

# 查看库数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES where table_schema='database_name';

# 查看表数据大小
select concat(round(sum(DATA_LENGTH/1024/1024),2),'MB') as data from information_schema.TABLES where table_schema='database_name' and table_name='table_name';
~~~


## 配置

~~~Text
# 显示配置
show variables;

# 修改配置net_write_timeout
set net_write_timeout = 600;

# 查看引擎
show engines;
~~~


### Timeout

~~~Text
# 连接过程中握手的超时时间
connect_timeout

# 不活跃的连接超时时间——交互模式下
interactive_timeout

# 不活跃的连接超时时间——非交互模式下
wait_timeout

# 从网络读取数据的超时时间——比如导入数据
net_read_timeout

# 从网络输出数据的超时时间——比如查询
net_write_timeout
~~~

### Query Cache

Query Cache建议关闭，因为QC的失效策略比较蛋疼，且只有在单一简单的业务查询下，整体性能才会有比较明显的优化。

~~~Text
# 关闭query cache
query_cache_type=off

# 设置query cache大小为0
query_cache_size = 0
~~~


### SQL_NO_CACHE

SQL_NO_CACHE的真正作用是禁止缓存查询结果，但并不意味着cache不作为结果返回给query。

