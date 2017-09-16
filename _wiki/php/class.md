---
title: class
layout: wiki
category: php
tags: [类]
---


## ClassName::class

获取ClassName的名称

## 访问控制

* public: 公有方法，默认，可任意访问
* protected: 保护，只有自身和子类父类具有访问权限
* private: 私有，只有自身具有访问权限

## 抽象和接口的比较

* 接口关键字为interface；抽象为abstract
* 抽象类不能实例化；接口也不行
* 含有抽象方法的必须是抽象类
* 抽象类的子类必须实现其所有抽象方法；接口的之类则必须实现其所有方法
* 接口定义的所有方法都必须是公有的
* 接口通过implements实现，也可以通过extends继承；抽象类只能用于继承
* 通过implements可以实现多个接口；extends只能继承一个



## triat

PHP5.4.0开始支持的特性，用于减少单继承的限制，增加代码复用性。注意优先级问题，当前类中的方法会覆盖 trait 方法，而 trait 方法又覆盖了基类中的方法。

~~~php
<?php

trait HelloWorld {
    public function sayHello() {
        echo 'Hello World!';
    }
}

class TheWorldIsNotEnough {
    use HelloWorld;
    public function sayHello() {
        echo 'Hello Universe!';
    }
}

$o = new TheWorldIsNotEnough();
$o->sayHello();


// 输出
Hello Universe!

?>
~~~


## 匿名类

~~~php
<?php

$val = new class {
    public function func() {
        echo "test";
    }
};

$val->func();

?>
~~~

## 遍历对象

foreach或者继承Iterator接口的实现方式都可以

## 重载

PHP的重载是动态的创建类方法，这和C++等语言不一样。实现的方式是魔术方法，如`__set`、`__get`等。

## final

PHP5以上支持的关键字，如果一个类方法声明为final，那这个方法就不能被之类覆盖，如果一个类声明为final，那这个类就不能被继承。

## clone

赋值不能完全拷贝对象，类似于

~~~php
<?php 

class cla {
    public $one;
    public $two;

    public function __construct() {
        $this->two = &$this->one;
    }
}

$val1 = new cla;
$val2 = clone $val1;
$val2->two = 2;
echo $val2->one;

?>
~~~

## 序列化

序列化一个对象将会保存对象的所有变量，但是不会保存对象的方法，只会保存类的名字。使用`serialize()`进行序列化，`unserialize()`进行反序列化。
