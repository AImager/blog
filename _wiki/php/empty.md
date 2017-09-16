---
title: empty
layout: wiki
category: php
tags: [空值,null]
---

## 0/false/null/array()/''

0、false、null、array()、''之间的==和===关系

~~~php
<?php
    $a = array('',array(),0,false,null);
	$b = array("''", "array()", "0", "false", "null");
    for($i = 0;$i<=4;$i++){
        for($j = 0;$j <=4;$j++){
            if($a[$i] == $a[$j] && $i!==$j){
                echo "{$b[$i]} == {$b[$j]}  ";
            }
            if($a[$i] === $a[$j] && $i!==$j){
                echo "{$b[$i]} === {$b[$j]}  ";
            }
        }
        echo "\n";
    }

// result
// '' == 0  '' == false  '' == null  
// array() == false  array() == null  
// 0 == ''  0 == false  0 == null  
// false == ''  false == array()  false == 0  false == null  
// null == ''  null == array()  null == 0  null == false  

?>
~~~