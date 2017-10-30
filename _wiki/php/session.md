---
title: session
layout: wiki
category: php
tags: [cookie,会话]
---

通过`session_start`开启一个会话session，流程如下（参考5.6.31源码）

* `static PHP_FUNCTION(session_start)`
    * 检查session_id（它是以全局配置项存在的，通过`PS()`访问全局配置项）是否异常（如存在但长度为0），无异常开始初始化。
    * `php_session_start(TSRMLS_C);`
        * 检查配置，session状态，session的管理形式（cookie还是file等），没问题继续。
        * 依次按照_COOKIE/_GET/_POST/URL的顺序查找是否已经存在session_id。
        * 检查当前请求是否被外部站点引用，该外部站点会使先前发现的session_id失效。
        * 特殊字符检查
        * `php_session_initialize(TSRMLS_C);`
            * 如果id不存在，则通过`s_create_sid`创建
            * 一些参数检验和操作
        * gc和cache等收尾工作

## 参考链接

* [session](http://php.net/manual/zh/session.examples.basic.php)