---
title: yield
layout: wiki
category: php
tags: [生成器,迭代器]
---

以一种简单的方式实现迭代器，相比于实现Iterator接口的方式，yield实现更方便。其实现方式和python的yield差不多。

## current 

## next

## rewind

返回第一个

## send

```php
<?php
function gen() {
    $ret = (yield 'yield1');
    var_dump($ret);
    $ret = (yield 'yield2');
    var_dump($ret);
}
 
$gen = gen();
var_dump($gen->current());    // string(6) "yield1"
var_dump($gen->send('ret1')); // string(4) "ret1"   (the first var_dump in gen)
                              // string(6) "yield2" (the var_dump of the ->send() return value)
var_dump($gen->send('ret2')); // string(4) "ret2"   (again from within gen)
                              // NULL               (the return value of ->send())
```