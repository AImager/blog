---
title: scope
layout: wiki
category: php
tags: [作用域,global,static,use]
---

## global

```php
$var1 = 1;
$var2 = 2;

function test(){
    global $var1, $var2;
    $var2 = &$var1;
    echo $var2;
    $var2 = 'test';
}

test();             // 1
echo $var2;         // 2
echo $var1;         // test
```

因为php没有文件域，所以只要写在文件非函数或者非对象内的代码，均作用于全局域。但是这里的全局域又和C不同，不能在函数内部直接访问，而且PHP不具备类似JS的闭包功能，因此，要实现函数对外部自由变量的访问，只能通过引用参数传递或者匿名函数use。

全局变量的使用除了`$val`的写法外，还可以用`$GLOBALS['val']`。

global用于将局部变量设置为对全局变量的引用，但它们依旧是局部变量，所以外接无法访问。

注意：global的时候不能初始化变量。


## 闭包

很多人说闭包必须有匿名函数的参与，也有说必须有两级函数，这个我表示怀疑，不过目前还没有很好的解释闭包的用处。

```php
$val = 2;
$func = function () use ($val) {
    echo $val;
};
$func();
```

## static

```php
function test() {
    static $val = 1;
    $val++;
    echo $val;
}

test();        // 2
test();        // 3
```

static用于静态化属性，在上面的函数内static的例子中，$val在第一次调用test()后，会一直存在于内存中，直到程序结束。程序运行期间，$val作用于所有test函数的调用内，因此第二次调用test()，$val从2开始自增。注意，$val只会static初始化一次，因此第二次调用test进行static的时候，$val并不会被修改为1；

```php
class test {
    static $val = 1;

    public static function func() {
        echo self::$val++;
    }
}

test::func();        // 1

$cla = new test();
$cla::func();        // 2
```

上面的例子是在类中使用static，和函数用static的核心一样，即都是将对象静态化，在第一次使用时生成后常驻内存，知道程序结束。使用类中的属性方法不能用`->`操作符，且在类内部需要使用`self::`代替`$this->`。

