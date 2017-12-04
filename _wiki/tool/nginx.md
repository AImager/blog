---
title: nginx
layout: wiki
category: tool
tags: [反向代理]
---

## 安装

```
# 源码安装
./configure --prefix=/server/environ/originlib/nginx-1.10.1 --conf-path=/server/environ/originlib/nginx-1.10.1/conf/nginx.conf --error-log-path=/server/log/nginx/error.log --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_flv_module --with-http_gzip_static_module --with-http_realip_module && make -j 8 && sudo make -j 8 install
```


## shell命令

```
# 指定配置文件启动
nginx -c file.conf

# 关闭nginx
nginx -s stop

# 重启nginx
nginx -s reload

# 测试配置是否正确
nginx -t
```

## 配置

下面是基本配置结构

```
user  www www;
worker_processes  4;

error_log  /server/log/nginx/error.log warn;
pid        /server/log/nginx/nginx.pid;

# workder打开文件的最大数量
worker_rlimit_nofile 65535;

# 描述
events {             
  use epoll;             
  worker_connections 65535;
}

# 
http {
    include       mime.types;                           
    default_type  application/octet-stream;             
    
    log_format  main  
        '$remote_addr | $remote_user | [$time_local] | "$request" | '
        '$status | $body_bytes_sent | "$http_referer"  | '     
        '"$http_user_agent" | "$http_x_forwarded_for" |  "$request_body"';
        
    #charset  gb2312;
                     
    server_names_hash_bucket_size 128;                  
    client_header_buffer_size 32k;                      
    large_client_header_buffers 4 32k;                  
    client_max_body_size 8m;                            
                     
    sendfile on;     
    tcp_nopush     on;                                  
                     
    keepalive_timeout 60;                               
                     
    tcp_nodelay on;  
                     
    fastcgi_connect_timeout 300;                        
    fastcgi_send_timeout 300;                           
    fastcgi_read_timeout 300;
    fastcgi_buffer_size 64k;
    fastcgi_buffers 4 64k;
    fastcgi_busy_buffers_size 128k;
    fastcgi_temp_file_write_size 128k;

    gzip on;
    gzip_min_length  1k;
    gzip_buffers     4 16k;
    gzip_http_version 1.0;
    gzip_comp_level 2;
    gzip_types       text/plain application/x-javascript text/css application/xml;
    gzip_vary on;

    log_format 
        '$remote_addr - $remote_user [$time_local] "$request" '
        '$status $body_bytes_sent "$http_referer" '
        '"$http_user_agent" "$http_x_forwarded_for"';
    
    server {
        listen       10301;
                  
        index index.html index.htm index.php;        
        root /server/wwwroot/manager_v4/Public;      
                  
        #ssl on;  
        #ssl_certificate  /etc/pki/weichecheCA/serverAPItest.crt;                       
        #ssl_certificate_key  /etc/pki/weichecheCA/serverAPItest.key;                   
                  
        location ~ .php                              
        {         
            fastcgi_pass  127.0.0.1:9000;        
            fastcgi_index index.php;             
            include fastcgi.conf;      
        }         
                  
        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$   
        {         
            expires 30d;     
        }         
        location ~ .*\.(js|css)?$                    
        {         
            expires 1h;         
        }         
                  
        include rewrite/yii.conf;
        access_log  /server/log/nginx/access/access.log;
    }
    
    #
    include vhosts/*.conf;
}
```



## 坑

下面是nginx的坑

### 转发的header中自动过滤掉下划线

解决办法最好就是用-代替下划线
