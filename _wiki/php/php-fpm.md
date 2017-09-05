---
title: php-fpm
layout: wiki
category: php
tags: [fastcgi]
---



## 配置

配置文件为php-fpm.conf，语法类似php.ini。还有类似env等配置没在下面列出，抽时间再看。

~~~
# 加载其它conf文件
include=etc/fpm.d/*.conf

# 默认pid文件，默认prefix为PHP_HOME/var
pid = run/php-fpm.pid

# 错误文件配置
error_log = log/php-fpm.log

# 错误级别配置
log_level = notice

# fork的最大的进程数量
process.max = 128

# fork process的用户和组
user = www
group = www

# listen的地址
listen = 127.0.0.1:9000

# 是否动态的fork和quit process，默认dynamic，可选static、ondemand
pm = dynamic

# static时恒定5个，dynamic时最多5个
pm.max_children = 5

# dynamic时启动server数量
pm.start_servers = 2

# 进程空闲多长时间被kill掉
pm.process_idle_timeout = 10s;

# reload php-fpm worker的最大请求次数
pm.max_requests = 500

# 请求日志
access.log = log/$pool.access.log

# 慢执行日志
slowlog = log/$pool.log.slow
~~~

