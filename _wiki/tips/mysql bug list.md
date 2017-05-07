---
title: mysql bug list
layout: wiki
category: tips
tags: [mysql,bug]
---

## 优化器使用索引合并后返回行数少于预期值

* 链接：[http://bugs.mysql.com/bug.php?id=69581](http://bugs.mysql.com/bug.php?id=69581)
* 版本：5.6.X-『官方说5.6.14就修了，但实测5.6.16还有问题』
* 引擎：InnoDB
* 复现：小数据量没出过问题，所以复现麻烦，但出现几个点的时候记得测试下，包括分区，同时用多个索引
* 避免：能升级的升级，不能升级的『比如阿里云截至2016-12-12号还是只有5.6的版本』想办法避免，比如直接建复合索引，不走优化器；或者直接禁用相关优化器设置`SET optimizer_switch = 'index_merge_intersection=off';`



## DISTINCT后使用COUNT结果错误

* 相似链接：[http://bugs.mysql.com/bug.php?id=70038](http://bugs.mysql.com/bug.php?id=70038)
* 版本：5.5.X-5.6.X
* 引擎：InnoDB
* 复现：情况很多，我的情况是DISTINCT多个字段，有字段为空，且两个都有索引，那得到的数量就是排除了NULL值的数量；链接里面的则是对复合唯一索引里面的字段进行DISTINCT后，再COUNT的结果会出错。
* 避免：这个问题坑很多，所以最好避免使用COUNT(DISTINCT )的写法。
