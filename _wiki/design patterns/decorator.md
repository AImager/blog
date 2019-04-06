---
title: decorator
layout: wiki
category: design patterns
tags: [装饰,修饰,结构型,模式]
---

对已有方法的功能扩展，其核心优势就是复用了装饰部分的代码。python自带装饰器语法糖，相比于不带语法糖的php而言，python不需要修改调用处的代码，但是需要修改被调用处的外围代码。不过一般而言，调用都多于被调用，所以python的修改量要小很多。

**注**：我认为装饰器对java等静态类型语言意义不大，因为静态类型无法传入不同类型方法作相同装饰，这样必须为每个需要装饰的方法都写个装饰方法或装饰类，当然装饰代码可以抽象出来供所有装饰方法调用，不过我还是怀疑这样复用的效果。

## python实现

```python
def printf(func):
    def decorator():
        print "test"
        func()
    return decorator

@printf
def test1():
    print "\n test1 \n"

test1()
```

## php实现

```php
function decorator($func) {
    echo("test");
    $func();
}

function test1() {
    echo "\n test1 \n";
}

decorator(test1);
```


