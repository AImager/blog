---
title: PHP命名空间
layout: post
tag: [PHP]
---

很多语言都有命名空间这个概念，不过以前在学校都是纸上谈兵，以为这个概念简单，就忽视了，现在刚上手工作，发现很多东西虽然简单但用处颇大，所以心想记些实用的东西也没有什么不可以，也算是对思路的一种改变，下面就以PHP为例介绍下命名空间。

命名空间的作用实际上和文件目录差不多，都是为了保证同名内容在局部环境下的全局兼容性，只是文件目录是为了保证文件的唯一性，而命名空间则是保证类的唯一性。来看一个demo

~~~PHP
<?php
  // ./test/test1.php
  
  namespace area1;
  require('test2.php');
  test::show(); //area1
  \area2\test::show(); //area2
  
  class test{
    static public function show(){
      echo "area1";
    }
  }
?>


<?php
  // ./test/test2.php
  
  namespace area2;
  class test{
    static public function show(){
      echo "area2";
    }
  }
?>
~~~

test1引用了test2，如果没有命名空间，那么直接调用test::show()就会冲突，而在引入命名空间后，test1中的test类和test2中的test类被分别隔离在area1和area2命名空间中，所以在test1中使用test::show()默认调用在area1中寻找类和方法，如果想使用别的空间中的类，这必须加上空间前缀，如\area2\（注意：如果加上的是area2\的前缀，那么最终查找的将是\area1\area2\test类，即类似于相对目录和全局目录的区别）。但如果在test1中需要经常引用test2中的类和方法，此时我们是否每次都加上前缀呢？这自然是很麻烦的，尤其是在支持多级目录的命名空间机制下，所以我们可以使用`use namespace name;`语句来直接将整个外命名空间包进来，不过此时就会引用重名的风险，也就失去了命名空间的实际作用。