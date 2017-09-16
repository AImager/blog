---
title: nginx
layout: wiki
category: tool
tags: [反向代理]
---

## 安装

~~~
# 源码安装
./configure --prefix=/server/environ/originlib/nginx-1.10.1 --conf-path=/server/environ/originlib/nginx-1.10.1/conf/nginx.conf --error-log-path=/server/log/nginx/error.log --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_flv_module --with-http_gzip_static_module --with-http_realip_module && make -j 8 && sudo make -j 8 install
~~~


## shell命令

~~~
# 指定配置文件启动
nginx -c file.conf

# 关闭nginx
nginx -s stop

# 重启nginx
nginx -s reload

# 测试配置是否正确
nginx -t
~~~



## 坑

下面是nginx的坑

### 转发的header中自动过滤掉下划线

解决办法最好就是用-代替下划线
