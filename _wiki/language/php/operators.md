---
title: operators
layout: wiki
category: php
tags: [运算符]
---

## ??

PHP7开始支持的运算符，`$val ?? 'value'`表示如果$val存在且非NULL，则返回$val，否则返回'value'。

## <=>

PHP7开始支持的运算符，`echo $val1 <=> $val2`表示如果$val1>$val2，返回1；$val1<$val2，返回-1；$val1==$val2，返回0。

## @

放在一个表达式前，该表达式的所有错误均被忽略

## 运算符优先级

参考[链接](http://php.net/manual/zh/language.operators.precedence.php)

## 参考链接

* [List of Parser Tokens](http://php.net/manual/en/tokens.php)