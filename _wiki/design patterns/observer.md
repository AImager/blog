---
title: observer
layout: wiki
category: design patterns
tags: [观察者,行为型]
---

当需要监听某个对象的属性变化的时候，可以在被监听类里添加方法，所有对待监听属性的修改都需要经过该方法，经过该方法的时候都会通知所有观察类（这些观察类都需要注册到被监听的类里面去），然后观察类根据消息做出反应。

## php实现

使用__set魔术方法是方便对所有属性的修改进行统一监听。

```php

class BeObserved {       // 被监听的类
    private $val1;
    private $val2;

    private $_observers = [];

    public function __set ($name, $value) {
        // 判断属性是否存在
        // array_key_exists($name,
        //     get_class_vars(get_class($this))
        // )
        $this->$name = $value;
        foreach($this->_observers as $val) {
            $val->update($name, $value);
        }
    }

    public function __get ($name) {
        return $this->$name;
    }

    public function register($observer) {
        $this->_observers[] = $observer;
    }
}

interface Observer {
    public function update ($name, $value);
}

class ObserverA implements Observer{
    public function update($name, $value) {
        echo "the value $name has been changed to $value";
    }
}

$change_cla = new BeObserved;
$change_cla->register(new ObserverA);
$change_cla->val1 = 1;

```