---
layout: wiki
tags: [框架]
---

## 注解

Service: 标注业务层组件
Controller: 标注控制层组件，返回json需要ResponseBody配合
RestController: 功能同Controller，只不过多了json返回的处理，Spring MVC提供
Repository: 标注数据访问组件
Component: 标注泛指组件

RequestMapping: Spring MVC提供
RequestParam

Autowired: 自动注入
Resource: 作用相当于Autowired，只不过Autowired按类型自动注入，而Resource按名字自动注入

Value: 使用配置变量

Bean
DependsOn: 声明当前bean依赖另外一个bean，保证bean的实例顺序化
Qualifier

## 约定

* 配置默认是src/main/resources/application.yml或者src/main/resources/application.properties


## log4j2

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


## WebMvcConfigurer

配置拦截器的接口