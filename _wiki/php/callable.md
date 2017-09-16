---
title: callable
layout: wiki
category: php
tags: [回调,callback,call_user_func]
---

## call_user_func

用于回调函数，下面的两个例子，一个实现了在类外部使用parent，另一个不指定直接调用预置的__invoke函数。这两个是普通函数调用实现不了的，除此之外，call_user_func和普通函数调用没有区别。

~~~php
<?php

class A {
    public static function who() {
        echo "A\n";
    }
}

class B extends A {
    public static function who() {
        echo "B\n";
    }
}

call_user_func(array('B', 'parent::who')); // A

/*===============================*/

class C {
    public function __invoke($name) {
        echo 'Hello ', $name, "\n";
    }
}

$c = new C();
call_user_func($c, 'PHP!');

?>
~~~

call_user_func_array和call_user_func几乎没有区别，只是call_user_func_array的第二个参数，也就是回调函数参数变成了数组形式，可以动态的进行参数扩展。

~~~php
<?php

function a($vala) {
    echo $vala;
};
function b($vala, $valb) {
    echo $vala . "\t" . $valb;
};

$arr = array("1");
call_user_func_array('a', $arr);
$arr = array("1", "2");
call_user_func_array('b', $arr);

?>
~~~


## 参考链接

* [Callbacks / Callables](http://php.net/manual/en/language.types.callable.php)