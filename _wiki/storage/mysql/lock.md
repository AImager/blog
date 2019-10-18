---
layout: wiki
tags: [锁]
---

## 锁分类

* 行级锁
* 页面锁
* 表级锁

## 引擎支持的锁

* MyISAM: 表锁
* MEMORY: 表锁
* BDB: 默认页面锁，支持表锁
* InnoDB: 默认行锁，支持表锁

## MyISAM锁

写互斥，写写互斥。

### concurrent_insert

concurrent_insert是MyISAM的一个配置参数，用于控制读写是否可并发，有以下三个可选值

* 0: 不允许并发插入
* 1: 当不存在删除行的时候，可在读的时候进行表尾插入操作，默认选项
* 2: 无论是否存在删除行，都可以在读的时候进行表尾插入操作

### 锁调度

写的优先级高于读，所以对一张表的操作队列，即使写操作是后进来的，也会插入到等待的读操作前面。这样导致写很多的时候读很容易阻塞，这也是为什么锁MyISAM适合读多写少的场景。


## Innodb锁

### 事务与ACID属性

* 原子性（Atomicity）
* 一致性（Consistent）
* 隔离性（Isolation）
* 持久性（Durable）


### 并发事务遇到的问题

* 更新丢失
* 脏读
* 不可重复读
* 幻读

### 事务隔离级别

数据多版本并发控制（MVCC）

* 未提交读（Read uncommitted）
* 已提交读（Read committed）
* 可重复读（Repeatable read）
* 可序列化（Serializable）

![](/media/img/mysql/隔离级别.png)

### 实现

只有通过索引条件检索数据，InnoDB才使用行级锁，否则，InnoDB将使用表锁。

* X锁（排他锁）
* IX锁（意向排他锁）
* S锁（共享锁）
* IS锁（意向共享锁）

![](/media/img/mysql/行锁兼容表.png)

### GAP锁

### Next-Key锁


### 悲观锁与乐观锁

悲观锁

乐观锁


## 参考链接

* [Mysql加锁处理分析](http://hedengcheng.com/?p=771#_Toc374698322)