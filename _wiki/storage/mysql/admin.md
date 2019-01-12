---
title: admin
layout: wiki
category: mysql
tags: [管理员,状态]
---

## 服务启动

```shell
# 从5.7开始，第一次启动前需要初始化
mysqld --initialize

# 直接运行模式
mysqld

# 安全模式下运行，默认运行模式
# 跳过权限检查，直接登录
mysqld_safe --skip-grant-tables
```

## 客户端连接

```
# 以cli方式登录mysql
mysql -h host -u username -p password -P port
```

## 查看基本信息

```shell
# 查看引擎
show engines;

# 查看版本号
select version();
```

## 查看服务状态

```shell
# 查看数据库执行状态，full用于显示完整sql信息
show full processlist;

# 查看所有数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES;

# 查看库数据大小
select concat(round(sum(DATA_LENGTH/1024/1024), 2),'MB') as data from information_schema.TABLES where table_schema='database_name';

# 查看表数据大小
select concat(round(sum(DATA_LENGTH/1024/1024),2),'MB') as data from information_schema.TABLES where table_schema='database_name' and table_name='table_name';
```




