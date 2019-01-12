---
title: install
layout: wiki
category: mysql
tags: [安装,docker]
---

5.7开始社区版分boost版和非boost版，因为5.7以上运行都需要boost，所以两者的区别仅仅是是否需要安装boost，即boost版自带boost。那么选择前可以看看是否安装了boost，可以查看boost版本文件是否存在，一般位置在`/usr/include/boost/version.hpp`。

## 源码安装

源码安装可以在source级别进行config，config的具体配置见[MySQL Source-Configuration Options](https://dev.mysql.com/doc/refman/5.7/en/source-configuration-options.html)，以下列举较为重要的配置

* base
	* DCMAKE_INSTALL_PREFIX = path: 安装目录
	* DMYSQL_DATADIR = path: 数据存储的目录
	* DMYSQL_UNIX_ADDR = sock_file: 用于监听的socket文件位置
	* DSYSCONFDIR = dir_path: 配置文件所在目录
	* DWITH_MYISAM_STORAGE_ENGINE = boolean: 是否开启MYISAM引擎，相应可开启INNOBASE
	* DDEFAULT_CHARSET = urf8: 默认编码
	* DDEFAULT_COLLATION = utf8_general_ci: 默认校验编码
	* DWITH_EXTRA_CHARSETS = all: 引入哪些额外的编码
	* DWITH_EXTRA_CHARSETS:STRING = all:
	* DMYSQL_TCP_PORT = 3306: 默认端口
	* DWITH_DEBUG = boolean: 是否开启调试
	* DENABLED_LOCAL_INFILE = boolean: 是否允许从客户端导入数据
* boost
	* DWITH_BOOST = path: 如果已经安装boost，可指定所在boost目录
	* DDOWNLOAD_BOOST = boolean: 如果没有安装boost，指定后可在编译时自动下载boost
	* DDOWNLOAD_BOOST_TIMEOUT = seconds: 下载boost时超时时间



```shell
# 源码安装，带boost版本
cmake . -DCMAKE_INSTALL_PREFIX=/install_path/mysql-x.x.xx \
-DWITH_BOOST=boost \
-DMYSQL_DATADIR=/data_path/mysql \
-DMYSQL_UNIX_ADDR=/dev/shm/mysql-x.x.xx.sock \
-DSYSCONFDIR=/install_path/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_EXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_EXTRA_CHARSETS:STRING=all \
-DMYSQL_TCP_PORT=3306 \
-DWITH_DEBUG=0 && make -j 8 && sudo make -j 8 install
```

## docker-compose

```dockerfile
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
```