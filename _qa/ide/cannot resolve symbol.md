---
title: cannot resolve symbol
layout: qa
tags: [Intellij,java]
---


File -> Project Structure -> Project，查看Project SDK设置是否正常。

maven项目检查pom.xml和本地仓库（默认.m2/repository）是否没有相关包

maven边栏
Reimport All Maven Projects：根据pom文件重新加载（导入）文件
Generate Sources and Update Folders For All Project：让源代码重新进行编译

File -> Invalidate Caches/Restart，彻底清除缓存，重建索引