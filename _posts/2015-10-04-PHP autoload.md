---
title: PHP自动加载
layout: post
tag: [PHP]
---

想象一下下面的情景，我现在要写一个框架，在入口函数要初始化各个模块，显然就要调用各个模块的初始化方法，但为了调用这些方法需要写一大串的require语句，而且稍微疏忽或者以后添加模块忘了加上require那框架就会运行出错，所以我能不能通过什么方式自动的将一些文件引用进去呢？答案就是PHP中的自动加载，直接上demo：

~~~PHP
<?php
  // ./test/aa.php

  function __autoload($class_name){
    require("$class_name".".php");
  }
  $a = new bb();
  $a->show();
?>


<?php
  // ./test/bb.php

  class bb{
    public function show(){
      echo "bb";
    }
  }
?>
~~~

以上demo中，aa.php在新建$a对象时并未找到类声明，此时Zend引擎会自动调用`__autoload函数`，在aa.php文件中由我们自己实现了一个`__autoload函数`，其功能是根据未找到的类名参数引入文件，如这里未找到的类名为bb，则aa.php引入的就是同级目录下的bb.php文件，所以在使用`__autoload函数`的时候，总是需要建立一个类名和引入文件名的映射。但假如我们在实现一个系统时需要引入各个模块，而各个模块的类文件映射规则都不一样，那此时该怎么做呢？可行的方案是将所有的规则写入`__autoload函数`中，通过file_exists判断各个规则的待引入文件是否存在，存在就引入，但这样会使得`__autoload函数`异常复杂，同时和软件工程的思想相悖，所以在PHP5引入了SPL标准库，为自动加载提供了更完备的解决方案，还是直接上demo：

~~~PHP
<?php
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

  spl_autoload_call("test1");
  spl_autoload_extensions(".php,.ini,.txt");
  spl_autoload_unregister('loadPHP');
?>



<?php
  // ./test/test1.ini

  class test1{ };
  echo "include test1 \n";
?>
~~~

SPL库的处理方式和`__autoload`的方式没有本质区别，只是将单一函数处理变成函数处理队列，并采用注册入队的方式来管理。所以不做太多分析，直接给出demo中几个重要函数的详细详细说明。

~~~PHP
spl_autoload_register([ callable $autoload_function
		[, bool $throw = true
		[, bool $prepend = false ]]])
~~~

`spl_autoload_register`用来取消`__autoload函数`【如果仍需要使用，需显式的注册到`__autoload队列`中去】，同时将$autoload_function加入到`__autoload队列`中，一旦出现类引用错误就依次调用`__autoload队列`中的函数，直到所需要的类可用为止【此时队列中剩下的函数将不再执行】。

参数$autoload_function表示可选的回调函数，当参数为空的时候会将`__autoload函数`的默认实现`spl_autoload(~)`加入到`__autoload队列`中去。实际测试后发现支持简单函数和静态类方法，可以以字符串形式和数组形式传入，如`function`，`class::function`，`array(class,function)`，后两种均表示静态方法。

参数$throw指无法注册时是否抛出异常；参数$prepend指是否将函数加入到队首，默认为队尾。

~~~PHP
spl_autoload(string $class_name
		[, string $file_extensions = spl_autoload_extensions() ])

spl_autoload_extensions([string $file_extensions])
~~~

`spl_autoload`用来在当前目录下寻找并引入以$file_extensions子串作为文件扩展名、$class_name作为文件前缀名的文件，需要注意的是这个函数并不支持重写，但可以直接调用。

`spl_autoload_extensions`用来设置自动加载文件的扩展名，在参数为空时的默认返回值为".php,.ini"。

~~~PHP
spl_autoload_call(string $class_name)

spl_autoload_functions()

spl_autoload_unregister(mixed $autoload_function)
~~~

`spl_autoload_call(~)`用来调用`__autoload队列`中的函数立即引入类文件，避免在类引用的时候才调入类文件。

`spl_autoload_functions(~)`返回`__autoload队列`中的所有函数组成的数组。

`spl_autoload_unregister(~)`用于注销`__autoload队列`中的函数。
