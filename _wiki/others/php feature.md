---
title: php feature
layout: wiki
category: others
tags: [特性]
---

## 安装

### 编译安装

~~~
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
~~~

### PHP扩展安装

~~~
/server/environ/php/bin/phpize \ 
&& ./configure --with-php-config=/server/environ/php/bin/php-config \ 
&& make && sudo make install
~~~

### 编译安装时的依赖列表

~~~
libxml2-dev libcurl4-openssl-dev libssl-dev libsslcommon2-dev 
libjpeg-dev libpng16-dev libfreetype6-dev libmcrypt-dev m4 
autoconf libevent-dev libmemcached-dev openssh-server
~~~



## 配置

~~~
# 根据更新时间戳检测文件更新，从而重新缓存opcache
opcache.validate_timestamps=1
opcache.revalidate_freq=0
~~~

## 模块化

### include/require

* include是用到的时候加载，若加载出错不会停止执行，只会反回个错误提示
* require是一开始就加载，若加载出错停止执行，返回错误


## 语法

### 0/false/null/array()/''

0、false、null、array()、''之间的==和===关系

~~~PHP
<?php
    $a = array('',array(),0,false,null);
	$b = array("''", "array()", "0", "false", "null");
    for($i = 0;$i<=4;$i++){
        for($j = 0;$j <=4;$j++){
            if($a[$i] == $a[$j] && $i!==$j){
                echo "{$b[$i]} == {$b[$j]}  ";
            }
            if($a[$i] === $a[$j] && $i!==$j){
                echo "{$b[$i]} === {$b[$j]}  ";
            }
        }
        echo "\n";
    }
?>

// result
'' == 0  '' == false  '' == null  
array() == false  array() == null  
0 == ''  0 == false  0 == null  
false == ''  false == array()  false == 0  false == null  
null == ''  null == array()  null == 0  null == false  
~~~



### 按引用传递

~~~PHP
function(&$a){$a++;}
~~~


## 预定义常量

* PATH_SEPARATOR: 常量":"，用作地址的分隔符


## ClassName::class

获取ClassName的名称


## 作用域

* static: 全局静态域
* self: 当前类域
* parent: 父类域

## 函数库

### 数组

* array_slice: 取出子数组
* array_splice: 从offset开始删除length个元素
* array_udiff: 通过回调函数处理数组比较
* array_product: 数组元素相乘

### 调试

* debug_backtrace: 跟踪调用栈

## 类库

* ReflectionClass: 用于分析类的类

## TODO

* 迭代器
* 魔术常量
* 魔术方法
* 超级全局常量
* 预定义常量
* Trait



