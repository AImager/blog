---
title: PHP特性
layout: post
tags: [php]
---

这篇文章会尽量列举PHP语言的特性以及易错点

* 安装
* 配置（bad）
* 模块化
* 常量
    * 魔术常量
* 语法
    * 空值
    * 类机制
* 函数库/类库
    * 数组
    * 异常
    * 自动加载类
    * 加密
    * ReflectionClass: 用于分析类的类

## TODO

* 迭代器
* 魔术常量
* 魔术方法
* 超级全局常量
* 预定义常量
* Trait

## 我不喜欢PHP的地方（主观）

* 混乱的命名和API设计（count、strlen、str_replace、strtotime）
* array满天飞（其实这个怪使用者）
* 没有好的异步方式，所以很多都局限在php-fpm这个架子里面
* 并行编程上没有好的实践
* 包管理
* 居然还需要用c这种异构语言来编写高性能库（php的核心用户不会用c去写库，而且还必须要用zend-api）
* 命名空间和包概念很乱