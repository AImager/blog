---
title: module
layout: wiki
category: php
tags: [require,include,namespace]
---


## include/require

require在出错时产生E_COMPILE_ERROR级别的错误。而include只产生警告E_WARNING，脚本会继续运行。

注：文件载入后，use只是简化使用的，并不是必须的。

## 单文件多namespace

一个文件可以支持多个namespace，如下：

```php
<?php 

namespace scopeone {
    class one {}
    echo "one";
}

namespace scopetwo {
    class two {}
    echo "two";
}

namespace { //全局空间
    echo "global";
	$name = "scopetwo\\two";	// 注意双斜线
    $val = new $name;
}
?>
```

上面是加括号的方式，更清晰，也可以不加括号，但那样就不支持全局空间代码，因为如果存在namespace必须有namespace置顶。当然，不推荐在一个文件中支持多个命名空间。

```php
<?php

namespace scopeone;
class one {}
echo "one";

namespace scopetwo;
class two {}
echo "two";

?>
```

## use

use加as用于简化导入的对象，use引入时都是基于`\`，即`use \name`等同于`use name`，所以开头的`\`一般都省略。

```php
<?php
namespace foo;
use My\Full\Classname as Another;
use My\Full\NSname;					// use My\Full\NSname as NSname
use function My\Full\functionName as func; 			// PHP 5.6+
use const My\Full\CONSTANT; 						// PHP 5.6+

$obj = new namespace\Another; 		// foo\Another
$obj = new Another; 				// My\Full\Classname
?>
```

use不影响动态类，new的时候不会使用别名。

```php
<?php
use My\Full\Classname as Another;

$name = "Another";
$val = new $name;					// Another, not My\Full\Classname
```

引用的解析有一些规则，举例如下

```php
<?php
namespace A;
foo();      // 首先尝试A\foo()，再尝试\foo()，但只要带namespace路径，就不会有第二步的全局查找
new B();    // 类的创建如果有路径就路径中找，没有就命名空间中找，不会自动全局查找。但没找到会尝试自动加载
?>
```

## include/require后的命名空间逻辑

```php
<?php
// test1.php
namespace A;
class test1 {}

// test2.php
namespace B;
require("test1.php");
use A\test1;
class test2 extends test1{}
	
// test.php
require("test2.php");
use A\test1;
$c = new test1;
?>
```

见如上例子，`require("test1.php");`后等价于如下内容

```php
<?php
namespace A {
	class test1 {}
}

namespace B {
	use A\test1;
	class test2 extends test1{}
}
?>
```

`require("test2.php");`后等价于如下内容

```php
<?php
namespace A {
	class test1 {}
}

namespace B {
	use A\test1;
	class test2 extends test1{}
}

namespace {
	use A\test1;
	$c = new test1;
}
?>
```

总结下来，即require/include进来后，引入文件的命名空间不影响被引入文件的命名空间，从而保证每个文件namespace和use的时候都是基于全局的，且是相互独立的。


## 查看编译的二进制模块信息

* `php --ri module_name`