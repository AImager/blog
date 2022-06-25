---
title: ORM或SQL
layout: post
tags: [对象关系映射]
typora-root-url: ../../blog
---

ORM的全称为Object Relational Mapping，中文名为『对象关系映射』。

## ORM相对于SQL的优缺点

相对来说，ORM的缺点就是SQL的优势地方，而优点也是SQL的劣势地方。

* 优点
    * 方便的使用面向对象，语句清晰
    * 防注入『这个其实不算ORM的核心，因为比如Phalcon的SQL形式写法也可以防注入』
    * 方便动态构造语句，对于不同的表的相同操作采用多态实现更优雅
    * 一定程度方便重构数据层『比如改表名，字段名等』
    * 设置钩子函数
* 缺点
    * 不太容易处理复杂查询语句
    * 性能较直接用SQL差


## 如何选择

尽量使用ORM，除了含子查询的复杂语句『不过大流量下的网站最好不要写这种复杂SQL』，当然这也只是一个原则，所以反过来说也可以，不过以下几个场景用ORM的好处是很明显的

* Model对象不确定的时候，使用多态的方式去处理不同实例的相同操作
* 语句结构不确定的时候，比如根据不同的情况Where子句不一样的时候，采用if的代码结构去控制ORM方法的使用比拼接SQL语句要清晰的多
* 设置钩子函数，比如分页里面，拿分页数据同时要count数据，那么就可以在Model里面插入这个算count的钩子函数（包括缓存逻辑）

## 参考链接

* [Using an ORM or plain SQL?](http://stackoverflow.com/questions/494816/using-an-orm-or-plain-sql/494853#494853)