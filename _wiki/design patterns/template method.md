---
title: template method
layout: wiki
category: design patterns
tags: [模板方法,行为型]
---

模板方法用于保证同一接口/抽象类的多个实现的某个行为步骤不变，但是每个步骤的具体行为可子类自己确定。比如对于角色抽象类都有着装的过程，且着装过程均是穿上装、穿下装、穿鞋，但是具体的着装不同角色不一样。这个例子不太好，不过已经表达意思了。

## php实现

~~~php
<?php

abstract class Role {
    abstract public function dress_tops();
    abstract public function dress_bottoms();
    abstract public function dress_shoes();

    final public function dress() {
        $this->dress_tops();
        $this->dress_bottoms();
        $this->dress_shoes();
    }
}

class Man extends Role {
    public function dress_tops() {
        echo "shirts";
    }

    public function dress_bottoms() {
        echo "pants";
    }

    public function dress_shoes() {
        echo "leather shoes";
    }
}

class Woman extends Role {
    public function dress_tops() {
        echo "skirts";
    }

    public function dress_bottoms() {
        echo "skirts";
    }

    public function dress_shoes() {
        echo "heels";
    }
}

$man = new Man;
$man->dress();

?>
~~~