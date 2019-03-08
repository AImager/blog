---
title: keyword
layout: wiki
category: c
tags: [关键字]
---

C89共32个关键字，C99共37个关键字

## 存储属性关键字（4个）

* auto：自动局部变量——默认隐藏，在函数体中碰见被定义后分配空间，函数体完成后撤销
* static：静态局部变量——编译时分配空间，始终占用内存单元
* register：寄存器变量——变量直接放在CPU的寄存器中
* extern：外部变量，提示在其它函数体或文件中寻找定义的变量——公用此变量

## 数据类型关键字（12个）

* int
* short
* long
* float
* double
* char
* struct
* union（联合类型）
* enum（枚举类型）
* void
* unsinged
* singed

## 控制语句关键字（12个）

* if
* else
* switch
* case
* default
* do
* while
* for
* return
* goto
* continue
* break

## C89其它关键字（4个）

* typedef：变量取别名——相当于一个函数
* const：声明只读变量
* volatile：声明变量可隐含改变
* sizeof：计算数据长度——相当于一个函数

## C99新增关键字（5个）

* restrict：用来限定指针，表明指针是访问一个数据对象的唯一且初始化对象
* inline：内联函数关键字，提高编译器效率
* _Complex：复数存储类型关键字
* _Imaginary：虚数存储类型关键字
* _Bool：bool存储类型关键字