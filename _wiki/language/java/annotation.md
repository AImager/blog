---
layout: wiki
tags: [注解]
---

## 元注解

* Documented: 注解修饰的注解类会被 JavaDoc 工具提取成文档
* Inherited: 用来指定该注解可以被继承
* Native: 1.8, 注解修饰成员变量，则表示这个变量可以被本地代码引用
* Repeatable: 1.8, 允许重复注解，非常有用
* Retention: 用于描述注解的生命周期，使用java.lang.annotation.RetentionPolicy的枚举类型
  * SOURCE: 在源文件中有效（即源文件保留）
  * CLASS: 在 class 文件中有效（即 class 保留）
  * RUNTIME: 在运行时有效（即运行时保留）
* Target: 指定一个注解的使用范围

## 编译期注解



## 运行时注解

