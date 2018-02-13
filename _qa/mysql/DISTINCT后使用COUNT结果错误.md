---
title: DISTINCT后使用COUNT结果错误
layout: qa
---

## DISTINCT后使用COUNT结果错误

* 相似链接：[http://bugs.mysql.com/bug.php?id=70038](http://bugs.mysql.com/bug.php?id=70038)
* 版本：5.5.X-5.6.X
* 引擎：InnoDB
* 复现：情况很多，我的情况是DISTINCT多个字段，有字段为空，且两个都有索引，那得到的数量就是排除了NULL值的数量；链接里面的则是对复合唯一索引里面的字段进行DISTINCT后，再COUNT的结果会出错。
* 避免：这个问题坑很多，所以最好避免使用COUNT(DISTINCT )的写法。