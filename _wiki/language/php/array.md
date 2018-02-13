---
title: array
layout: wiki
category: php
tags: [数组,函数]
---

## key

key 可以是 integer 或者 string。key 会有如下的强制转换：

* 字符串为合法整型值的字符串会被转换为整型。
* 浮点数也会被转换为整型，意味着其小数部分会被舍去。
* 布尔值也会被转换成整型。
* null会被转换为空字符串""。
* 数组和对象不能被用为键名。

注意，如果转换后出现key重合，则后面的value会替换掉前面的value。

```php
<?php

$array = array(
    -1    => "a",
    "1"  => "b",
    "1" => "c",
    1.5  => "c",
    true => "d",
    null => "nih",
);
var_dump($array);


// 输出
array(3) {
  [-1]=>
  string(1) "a"
  [1]=>
  string(1) "d"
  [""]=>
  string(3) "nih"
}

?>
```


php不区分索引数组和关联数组，会默认加上递增key，生成的递增key基于前面最后的非负整数key。

```php
<?php

$array = array(
    "a",
-6 => "b",
    "c",
"s" => "d",
    "e"
);
var_dump($array);

// 输出
array(5) {
  [0]=>
  string(1) "a"
  [-6]=>
  string(1) "b"
  [1]=>
  string(1) "c"
  ["s"]=>
  string(1) "d"
  [2]=>
  string(1) "e"
}

?>
```

## function

* array_slice: 取出子数组
* array_splice: 从offset开始删除length个元素
* array_udiff: 通过回调函数处理数组比较
* array_product: 数组元素相乘