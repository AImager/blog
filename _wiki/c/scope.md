---
title: scope
layout: wiki
category: c
tags: [作用域,static,extern]
---

## static 

相比于直接使用全局变量，static修饰后的结果是变量被放置在全局内存区，同时全局作用范围被限制在文件内。

如果多个文件使用同名的全局变量，但是没有使用static或者extern进行修饰，就会出现链接错误，提示duplicate symbol。

## extern

extern修饰后的全局变量可以算真正意义上的全局变量，所有文件均可调用，这个时候无论在多少个文件声明都只有一块固定的静态内存区。调用前，所有文件都需要使用extern声明一遍。但不能出现多个extern初始化，会出现duplicate symbol的链接错误。最好不要使用extern进行初始化。