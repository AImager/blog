---
layout: wiki
tags: [类型转换]
---

## 类型

* Boolean
	* `$val = True;`
	* `$val = false;`
* Integer
	* `$val = 0b11111; 二进制`
	* `$val = 0x12A; 十六进制`
	* `$val = 0x12a; 十六进制`
	* `$val = 0123; 八进制`
* Float
	* `$val = 1.234;`
	* `$val = 1.2e3; 1.2*10^3`
	* `$val = 7E2; 7*10^2`
* String
	* ''
	* ""
	* heredoc
	* newdoc
* Array
* Object
* Resource
	* 通过get_resource_type()获取resource类型，所支持的类型见[资源类型列表](http://php.net/manual/zh/resource.php)
* NULL
* Callable
* 伪类型
	* mixed
	* number
	* array|object
	* void
	* ...

## 类型转换

类型转换包括自动转换和强制转换，自动转换几个重点如下

* `+/-/*/\`等操作符，任何一个操作数是float，则所有的操作数都被当成float，否则操作数会被解释为integer。

```php
var_dump([
    "  0.34df " * 2,
    " ss 0.34df " * 2,
    " 123sd " > 0,
    null + " 213.23 " + " 34543.34 ",
    "0" && 2,
    (boolean)"0",
    (boolean)"0 "
]);

// 输出
array(7) {
  [0]=>
  float(0.68)
  [1]=>
  int(0)
  [2]=>
  bool(true)
  [3]=>
  float(34756.57)
  [4]=>
  bool(false)
  [5]=>
  bool(false)
  [6]=>
  bool(true)
}
```


### 转化为对象

任何类型的值被转换成对象，将会创建一个内置类 stdClass 的实例。如果该值为 NULL，则新的实例为空。array转换成object将使键名成为属性名并具有相对应的值，数字键的key引用时候必须用花括号。对于其他值，会包含进成员变量名scalar。

```php
$obj = (object) array('1' => 'foo');
echo $obj->{1};     // outputs 'foo'

$obj = (object) 'ciao';
echo $obj->scalar;  // outputs 'ciao'

?>
```


### 转化为数组

非object类型转换为数组，得到单一key为0的数组。

object转换为array，键名为成员变量名，有几点需要说明下：

* 如果属性是保护类型，转换后为的key为`\0类名\0属性名`，`\0`为ASCII码的空字符，dump会乱码
* 方法全部丢失
* value为实例的实际值，如果值为object，则仅显示`object(类名)`，所以彻底转换需要递归

```php
class B{
    private $AC = 1;
    public $AA = 2;
    public $c ;
    public function __construct() {
        $this->c = new stdClass;
    }
    public function test() {
        echo "nihao";
    }
}

var_dump((array) new B());


// 输出
array(3) {
  [""]=>
  object(stdClass)#2 (0) {
  }
}
```

### 转换为string

true转换为"1"，false转换为""，null转换为""，array强制转换转换为"Array"，obejct强制转换为"Object"，PHP5起可用魔术方法__toString。




