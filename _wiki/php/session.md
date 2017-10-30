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

`session_id($id = null)`用于设置和读取session_id，如果是设置就必须放在`session_start()`之前才能生效。**WHY?**

`$_SESSION`会在会话结束前被序列化，然后写入session存储。

当session以文件存储的时候，会存在锁的问题，文件锁会从`session_start()`持续到会话结束或执行`session_​write_​close()`，因此单个页面ajax过多的时候，会容易阻塞，再加上并发的影响，很可能拖垮服务器，所以最好尽快执行`session_​write_​close()`。

## 参考链接

* [session](http://php.net/manual/zh/session.examples.basic.php)
* [Output Control函数](http://php.net/manual/zh/ref.outcontrol.php)
* [session运行时配置](http://php.net/manual/zh/session.configuration.php#ini.session.use-trans-sid)