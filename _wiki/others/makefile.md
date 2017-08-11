---
title: makefile
layout: wiki
category: others
tags: [编译]
---


## Makefile基础教程

### Makefile大体框架

~~~Text
target:prerequisites
command

target：目标文件或者标签
prerequisites：生成目标文件的依赖文件
command：命令，支持大部分shell命令
~~~

### Makefile工作原理

当prerequisites依赖文件有至少一个比target目标文件要新的时候，即执行对应command命令。而对于多个target：prerequisites，通过依赖关系从高层向底层查找依赖，如果查找到最底层依赖文件存在，则按序执行command，若不存在，则报错


### Makefile变量

和shell的赋值一模一样，调用则是$(obj)
