---
title: primary key
layout: wiki
category: mysql
tags: [主键,外键]
---

## 主键

主键是唯一的unique key。

## 外键

如果一个表的某个字段指向另一个表的主键，就称该字段为外键。被指向的称为主表，指向的称为从表。外键常有以下应用（也可以称为其特性）：

* 约束: 只有主表的外键存在某个值的时候，从表才能插入对应属性为该值的行，自动行为。
* 级联操作: 设置主表数据变化后的从表级联操作。

级联操作有两个触发条件，`on delete`和`on update`，即删除和更新的时候。而触发后的级联操作有以下三种

* cascade: 相应执行删除或者更新
* restrict: 拒绝主表相关操作
* set null: 从表不指向主表任何记录

```shell
# 往A表添加field字段，field是指向B表field字段的外键
# 设置级联，当A的field某值完全删除后，B表field含有该值的行都被删除
alter table A add foreign key (field) references B (field)
on delete cascade;
```

## 超键/候选键

数据库理论概念

* 超键: 在关系中能唯一标识元组的属性集称为关系模式的超键。超键是候选键和主键的超集。
* 候选键: 是最小超键，即没有冗余元素的超键。

超键即unique key，主键是唯一的unique key，候选键是最小unique key。


