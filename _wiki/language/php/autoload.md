---
title: autoload
layout: wiki
category: php
tags: [自动加载]
---

自动加载主要有两个功能，一是无需事先引入类文件，而是在使用的时候发生类引用错误自动引入相关类文件；二是通过极少的代码，使项目在运行时自动载入大量的类文件，以替代重复的require/include编码。这里主要介绍的是PHP5开始使用的自动加载类，虽然`__autoload函数`也可以使用，但是在7.2.0版本已经被反对使用了。以下为常用的自动加载类函数

```php
spl_autoload_register([ callable $autoload_function
        [, bool $throw = true
        [, bool $prepend = false ]]])

spl_autoload(string $class_name
        [, string $file_extensions = spl_autoload_extensions() ])

spl_autoload_extensions([string $file_extensions])

spl_autoload_call(string $class_name)

spl_autoload_functions()

spl_autoload_unregister(mixed $autoload_function)
```

`spl_autoload_register`用来取消`__autoload函数`，同时将`$autoload_function`加入到`__autoload队列`中，一旦出现类引用错误就依次调用`__autoload队列`中的函数，直到所需要的类可用为止（此时队列中剩下的函数将不再执行）。参数`$autoload_function`表示可选的回调函数，当参数为空的时候会将`__autoload函数`的默认实现`spl_autoload(~)`加入到`__autoload队列`中去。实际测试后发现支持简单函数和静态类方法，可以以字符串形式和数组形式传入，如`function`，`class::function`，`array(class,function)`，后两种均表示静态方法。参数`$throw`指无法注册时是否抛出异常。参数`$prepend`指是否将函数加入到队首，默认为队尾。

`spl_autoload`用来在当前目录下寻找并引入以`$file_extensions`子串作为文件扩展名、`$class_name`作为文件前缀名的文件，需要注意的是这个函数并不支持重写，但可以直接调用。

`spl_autoload_extensions`用来设置自动加载文件的扩展名，在参数为空时的默认返回值为".php,.ini"。

`spl_autoload_call(~)`用来调用`__autoload队列`中的函数立即引入类文件，避免在类引用的时候才调入类文件。

`spl_autoload_functions(~)`返回`__autoload队列`中的所有函数组成的数组。

`spl_autoload_unregister(~)`用于注销`__autoload队列`中的函数。

## demo

```php
  // ./test/main.php

  //set_include_path("dir".PATH_SEPARATOR.get_include_path());
  //echo get_include_path();

  function loadPHP($class_name){
    if(file_exists("$class_name.php")){
      include_once $class_name.'.php';
    }
    echo "PHP \n";
  }

  function loadINI($class_name){
    if(file_exists("$class_name.ini")){
      include_once $class_name.'.ini';
    }
    echo "INI \n";
  }

  spl_autoload_register('loadPHP');
  spl_autoload_register('loadINI');

  $a = new test1();

  // spl_autoload_call("test1");
  // spl_autoload_extensions(".php,.ini,.txt");
  // spl_autoload_unregister('loadPHP');



  // ./test/test1.ini

  class test1{ };
  echo "include test1 \n";
```
