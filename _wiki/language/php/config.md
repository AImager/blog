---
layout: wiki
tags: [配置,php.ini]
---

以下都是相对而言比较重要的配置。可以通过`ini_get($config_name)`获取配置，因此可以在php.ini中设置一些全局变量，比如开发环境，但因为是对所有php有效，所以不如在nginx中对项目有效的配置。

## base

```
# 设置脚本执行的最大内存
memory_limit = 128M

# 设置脚本执行的最长时间，秒
max_execution_time = 60

# socket无数据传输超时时间
default_socket_timeout = 60
```

## error

```
# 显示错误
display_errors = On

# error report级别
error_reporting = E_ALL

# 是否log error
log_errors = On

# 最大错误长度
log_errors_max_len = 1024

# error log位置
error_log = /server/log/php/php_errors.log
```

## data handling

```
# post最大size
post_max_size = 8M

# 默认生成的media type
default_mimetype = "text/html"

# 默认的php文件解析编码
default_charset = "UTF-8"
```


## upload

```
# 是否开启http文件上传
file_uploads = On

# 允许上传的最大文件size
upload_max_filesize = 2M

# 每个请求能上传的最大文件数
max_file_uploads = 20
```

## session

session配置的很多，除了下面的，还有可能用到的有`gc`、`cache`等session配置，需要时可直接搜索php.ini文件

```
# session的存储形式
session.save_handler = files

# session以文件形式存储时的文件路径，默认/tmp
session.save_path = "/tmp"

# 是否使用session存储cookie
session.use_cookies = 1

# 是否只使用使用cookie存储session
session.use_only_cookies = 1

# 使用cookie时的session名
session.name = PHPSESSID

# session是否随请求自启动
session.auto_start = 0

# session的生存时间，0表示直到浏览器重启
session.cookie_lifetime = 0
```

## opcache

```
# 是否开启opcache，web和cli模式分别配置
opcache.enable=0
opcache.enable_cli=0

# 根据更新时间戳检测文件更新，从而重新缓存opcache
opcache.validate_timestamps = 1

# 多少秒检查一次文件变化，从而重新cache，0表示不间断检查
opcache.revalidate_freq = 0

# opcache内存占用阈值
opcache.memory_consumption = 64
```


## extension

```
# 加载扩展
extension = swoole.so

# 标签标识某一类设置
[swoole]
```


## database

```
# 连接database时候将默认开启safe_mode选项
sql.safe_mode = Off
```


### mysql

```
[mysql]

# mysql缓存大小，mysqlnd使用时有效
mysql.cache_size = 2000

# 连接超时时间
mysql.connect_timeout = 60

[mysqli]

# mysql重连
mysqli.reconnect = Off
```