---
title: control statement
layout: wiki
category: php
tags: [控制语句]
---

## html嵌套控制语句

语法有差异，不建议使用，即使用也用特定的模板语言，因为优化过。

```php
<?php if ($a == 5): ?>
    A is equal to 5
<?php endif; ?>
```

## declare

设定一段代码的执行指令。目前支持两种条件

* ticks=N，{}内执行N条低级OPCODE代码后，触发`register_tick_function()`注册的函数
* encoding=''，设定{}内为指定的编码

```php
function ticksfunc() {echo "func";}
register_tick_function("ticksfunc");
declare(ticks = N) {
    for ($i = 1; $i < 10; $i++) {echo $1;}
}
```

```php
declare(encoding = '') {
}
```

## goto

加标签用goto，类似C，不推荐使用