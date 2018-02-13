---
title: install
layout: wiki
category: php
tags: [安装]
---

## 编译安装

```
./configure --prefix=/server/environ/originlib/php-5.6.26 \
--with-config-file-path=/server/environ/originlib/php-5.6.26/etc \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-mysql-sock=/dev/shm/mysql.sock \
--with-config-file-scan-dir= \
--with-iconv-dir --with-zlib --enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--with-curl \
--enable-mbregex \
--enable-ftp \
--enable-fpm \
--enable-json \
--enable-mbstring \
--with-mcrypt \
--with-gd \
--with-freetype-dir \
--with-jpeg-dir --with-png-dir --enable-exif \
--enable-gd-native-ttf \
--with-openssl \
--with-mhash \
--with-libxml-dir \
--enable-sockets \
--enable-zip \
--without-pear \
--with-pgsql \
--enable-debug \
--enable-maintainer-zts && make -j 8 && sudo make -j 8 install
```

## PHP扩展安装

```
/server/environ/php/bin/phpize \ 
&& ./configure --with-php-config=/server/environ/php/bin/php-config \ 
&& make && sudo make install
```

## 编译安装时的依赖列表(ubuntu)

```
libxml2-dev libcurl4-openssl-dev libssl-dev libsslcommon2-dev 
libjpeg-dev libpng16-dev libfreetype6-dev libmcrypt-dev m4 
autoconf libevent-dev libmemcached-dev openssh-server
```