---
title: 一个功能完备的框架
layout: post
tags: [框架]
---

## feature

### 设计阶段

* 代码自动文档化：接入类似YAPI的API平台，CI流水线输出
* dao层声明化配置：打通结构化存储，CI检查结构并输出，对于web-dao，这里甚至可以直接从API平台读取生成代码。

### web能力

* PATH路由
  * 标准HTTP六种协议头
  * path参数
  * 路由组
* 协议正反序列化
  * HTTP
  * JSON
  * YAML
* template-rendering
  * HTML
  * JSON
* validator
* metadata传递：比如request_id（gdp)
* API Version支持：请求加header，配置放在router，此功能待考虑
* 拦截器：模块开发支持
* 函数式RPC：AOP提供支持，方便的进行服务化和sdk的转换
* session
* cookie
* 静态文件访问/上传
* 重定向

### 非web能力

* 长连接：socket、http2 server push

### 资源ORM

* db
* cache
* 文件

### 安全

* CSRF
* 防注入
* 权限管理：常见oauth解决方案
* HTTPS支持

### 服务化

* 服务注册发现：包括健康检测
* 请求负载均衡：支持常用算法
* 并行请求

### 异常处理

* catch/error异常管理：异常唯一id，code码归类
* 限流：令牌桶
* 熔断：保护下游服务
* Fallback降级：通过静态响应的方式
* Graceful：优雅停机，catch panic（gdp)

### 测试

* 单测框架

### 集成部署

* 金丝雀发布：也叫灰度发布
* 蓝绿部署
* AB Test

### 运维

* 格式化日志输出：为完善监控奠定基础
* 全链路追踪









