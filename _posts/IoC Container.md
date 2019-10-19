---
title: IoC容器
layout: post
tags: [工厂,设计模式,控制反转,容器]
---


UML官方是这六种关系，Dependency(依赖)，Association(关联)，Aggregation(聚合)，Composition(组合)，Generalization/Inheritance(泛化)，Realization/Implementation(实现)

## 依赖是什么？它导致了什么问题？

依赖是什么？martin fowler在《UML DIS》里给出了如下的解释

> a dependency exists between two elements if changes to the definition of one element (the supplier) may cause changes to the other (the client) .

即当某一个元素A的变更可能导致另外一个元素B的变更时，则称这两个元素间存在依赖，更确切的说，元素B依赖于元素A。这是个抽象

## 依赖倒置原则（DIP）

### DIP的简单依赖于抽象

### Dependency Injection vs Factory Pattern

## 依赖注入解决了什么问题？

## 参考链接

* [Laravel学习笔记——神奇的服务容器](https://learnku.com/articles/789/laravel-learning-notes-the-magic-of-the-service-container)
* [Difference between association and dependency?](https://stackoverflow.com/questions/1230889/difference-between-association-and-dependency)
* [OMG UML](https://www.omg.org/spec/UML/2.5.1/PDF)
* [DependencyAndAssociation](https://martinfowler.com/bliki/DependencyAndAssociation.html)
* [UML Distilled](https://book.douban.com/subject/1460848/)
* [敏捷软件开发](https://book.douban.com/subject/1140457/)