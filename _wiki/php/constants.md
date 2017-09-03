---
title: constants
layout: wiki
category: php
tags: [魔术常量,define]
---

## define

通过define定义常量，注意以下几点：

* 常量命名原则和变量一样，不需要$符号
* 常量可以不用理会变量的作用域而在任何地方定义和访问
* 常量一旦定义就不能被重新定义或者取消定义
* 常量的值只能是标量『boolean、integer、float、string』，resource也可以，但不推荐

如果常量名是动态的，可用通过`constant($name)`获取常量值。通过`get_defined_constants()`可以获得已定义常量。

## 魔术常量

* __LINE__: 当前行号
* __FILE__: 当前文件名，PHP4.0.2后为绝对路径
* __DIR__: 当前绝对目录，除非是根目录，否则不包含最后`\`
* __FUNCTION__: 当前函数名
* __CLASS__: 当前类名
* __TRAIT__: Trait的名字
* __METHOD__: 类的方法名
* __NAMESPACE__: 当前命名空间

## 常见非魔术预定义常量

* PATH_SEPARATOR: 常量`:`，用作地址的分隔符

## 参考链接

* [预定义常量](http://php.net/manual/zh/reserved.constants.php)