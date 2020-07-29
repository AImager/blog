---
layout: wiki
tags: [日志]
---


## 配置

```xml
%p   ##日志级别
%c{参数} 或 %logger{参数}  ##输出日志名称
%C{参数} 或 %class{参数    ##输出类型
%d{参数}{时区te{参数}{时区} ##输出时间
%F|%file                  ##输出文件名
highlight{pattern}{style} ##高亮显示
%l  ##输出错误的完整位置
%L  ##输出错误行号
%m 或 %msg 或 %message ##输出错误信息
%M 或 %method ##输出方法名
%n            ##输出换行符
%level{参数1}{参数2}{参数3} ##输出日志的级别
%t 或 %thread              ##创建logging事件的线程名
```