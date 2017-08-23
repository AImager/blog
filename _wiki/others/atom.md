---
title: atom
layout: wiki
category: others
tag: [编辑器]
---

## find and replace

使用`!`排除不需要包含的文件或者目录

## 快捷键

使用`'cmd-q': 'unset!'`取消快捷键的设置

## ss代理

测试后发现只支持http/https代理，但是mac下ss只支持http代理，所以设置文件.atom/.apmrc如下

~~~TEXT
strict-ssl=false
https-proxy=http://127.0.0.1:port
http-proxy=http://127.0.0.1:port
~~~

port一般是1087。可以把设置文件sync-settings里面去