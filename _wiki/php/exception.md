---
title: exception
layout: wiki
category: php
tags: [异常,error]
---

## backtrace

使用`debug_backtrace()`进行调用栈跟踪

## error_reporting

参考[预定义错误级别](http://php.net/manual/zh/errorfunc.constants.php)，通过`error_reporting`设定报错级别。

## 异常

参考[异常处理类](http://php.net/manual/zh/language.exceptions.extending.php)。

PHP7将一部分Exception异常修改为Error异常，而这部分错误就不能通过`catch(Exception $e)`来捕获，而需要通过`catch(Error $e)`来捕获。

### fatal error

如果异常没有被捕获，就会被抛出fatal error