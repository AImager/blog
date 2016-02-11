# Mysql教程


## 安装
MAC下面用dmg包直接安装mysql最方便



## 开启mysql引擎服务程序（注意使用权限）：
$(installLocation)/bin/mysqld：直接运行模式
$(installLocation)/bin/mysqld_safe：安全模式下运行，默认运行模式



## mysql命令：以当前用户访问，后面接数据库名称
-h <host_url>：连接的数据库位置
-u <user_name>：登录的用户名
-p <user_password>：登录的密码


## 默认数据库mysql
user：存储用户信息的表


## 确定使用数据库
use mysql_name;





## 显示当前用户对各数据库的权限
show grants;








## 显示完整用户    
SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;



## 修改用户密码（实际上就是在mysql中更新表user，更改后需要重启）
UPDATE user SET password=PASSWORD('password') WHERE user='user_name';


--------------------------------------


## 显示所有当前用户可使用的数据库
show databases;

## 显示当前数据库中的表
show tables;

## 创建数据库    
create database database_name;


## 删除数据库
drop database database_name;
