---
layout: wiki
tags: [包管理]
---


## mvn常见指令

-D 指定参数，如 -Dmaven.test.skip=true或者-DskipTests 跳过单元测试；
-P 指定 Profile 配置，可以用于区分环境，本质上就是参数 spring.profiles.active；
-e 显示maven运行出错的信息；
-o 离线执行命令,即不去远程仓库更新包；
-X 显示maven允许的debug信息；
-U 强制去远程更新snapshot的插件或依赖，默认每天只更新一次。
-B 以批处理方式执行；

## 标准命令

mvn clean，清理maven编译打包的一些产出，即项目下的target目录
mvn compile，编译代码生成class文件，产出放在target目录
mvn install，打包安装到本地仓库，包括compile和test过程
mvn package，打包编译好的class
mvn deploy，发布项目到远程仓库

## 组合命令

mvn tomcat:start，启动tomcat程序
mvn springboot:run，启动springboot程序
mvn source:jar，生成源码jar包

## 常见参数

maven.test.skip=true：跳过测试
skipTests：跳过测试



## POM

project: 最外层标签，标识一个项目
modelVersion: POM版本，现在唯一支持的是4.0.0
groupId: 包所在的组
artifactId: 包标识
version: 包版本
parent: 用于继承复用的包描述
properties: 定义变量，其它地方可引用
build:
plugins:
dependency:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                      http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <properties>
    <!-- 定义 mojo 版本号 -->
    <mojo.version>4.0.2</mojo.version>
  </properties>

  <groupId>org.codehaus.mojo</groupId>
  <artifactId>my-project</artifactId>
  <version>${mojo.version}</version>
</project>
```