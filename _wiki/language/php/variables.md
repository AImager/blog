---
title: varialbes
layout: wiki
category: php
tags: [预定义变量,超定义变量,可变变量]
---

## 可变变量

可变变量指名称可变化的变量。

```php
<?php

class foo {
    var $bar = 'I am bar.';
    var $arr = array('I am A.', 'I am B.', 'I am C.');
	var $r   = 'I am r.';
}

$start = 'b';
$end   = 'ar';
echo $foo->{$start . $end} . "\n";		// I am bar.

$arr = 'arr';
echo $foo->$arr[1] . "\n";			// I am r.
echo $foo->{$arr}[1] . "\n";		// I am B.

?>
```


```php
<?php

$Bar = "a";
$Foo = "Bar";
$World = "Foo";
$Hello = "World";
$a = "Hello";

$a; //Returns Hello
$$a; //Returns World
$$$a; //Returns Foo

?>
```

从上面的例子看，某种意义上像复杂的语法糖，这里面还涉及到**优先级**，所以不太建议这样用，清晰有时候比简洁更重要。


## 超全局变量

超全局变量属于预定义变量，只不过它们更特殊，它们可以在全部作用域中始终可用。

* $GLOBALS
* $_SERVER
* $_GET
* $_POST
* $_FILES
* $_COOKIE
* $_SESSION
* $_REQUEST
* $_ENV


## 预定义变量

* $_COOKIE
* $php_errormsg
* $HTTP_RAW_POST_DATA
* $http_response_header
* $argc
* $argv
