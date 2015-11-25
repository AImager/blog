---
title: php
layout: wiki
category: tips
tags: [语言,php]
---  

## 0/false/null/array()/''

0、false、null、array()、''之间的==和===关系

```PHP
<?php
	$a = array('',array(),0,false,null);
	for($i = 0;$i<=4;$i++){
		for($j = 0;$j <=4;$j++){
			if($a[$i] == $a[$j] && $i!==$j){
		    echo "$i == $j  ";
			}
			if($a[$i] === $a[$j] && $i!==$j){
				echo "$i === $j  ";
			}
		}
		echo "\n";
	}
?>

// result
0 == 2  0 == 3  0 == 4  
1 == 3  1 == 4  
2 == 0  2 == 3  2 == 4  
3 == 0  3 == 1  3 == 2  3 == 4  
4 == 0  4 == 1  4 == 2  4 == 3  
```


## ==/===

===会检索类型的区别

## include/require

include是用到的时候加载，若加载出错不会停止执行，只会反回个错误提示</br>
require是一开始就加载，若加载出错停止执行，返回错误

## 按引用传递

```PHP
function(&$a){$a++;}
```

## 函数集锦

一个记录PHP函数的小表格

```PHP
gettype(mixed $var)：获取变量类型

date(string $format [, int $timestamp = time() ])：将时间戳格式化为支付类型
  date('Y-m-d H:i:s', time())：格式化为"年-月-日 小时-分钟-秒"
  
PATH_SEPARATOR：常量":"，用作地址的分隔符
```