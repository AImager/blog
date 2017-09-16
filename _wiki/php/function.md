---
title: function
layout: wiki
category: php
tags: [函数,变长参数]
---


## 按引用传递

默认值传递

~~~php
<?php
function(&$a){$a++;}
?>
~~~


## 变长参数

在PHP5.6及以上的版本中，由语法实现；在PHP5.5及更早版本中，使用函数`func_num_args()`、`func_get_arg()`、`func_get_args()`实现。下面为5.6以上的实现方式

~~~php
<?php
function printall(...$numbers) {
    foreach ($numbers as $n) {
        var_dump($n);
    }
}

printall(1, ["s", "c"], "sfaf");

?>
~~~

而对于普通的函数调用，也可使用...加数组的形式实现

~~~php
<?php 

function printall($arg1, $arg2) {
    var_dump($arg1);
    var_dump($arg2);
}

$arr = [
    ["s", "c"], 
    "sfaf"
];

printall(...$arr);

?>
~~~