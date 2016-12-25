---
title: tar
layout: wiki
category: shell
tags: [打包,解压]
---

## 功能描述

打包命令，支持gzip和bzip2，所以只需要这个命令即可，需要注意的是，打包的信息中是包含文件的权限，但是记录的权限是uid和gid

## 实例

~~~
tar <options <files | dirs>>
~~~

### -z

当文件用gzip加压的时候，加这个参数直接进行解压后再进行解包

### -x

从归档文件中提取

### -v

处理文件时显示信息

### -f

输出结果到文件或设备（必须的参数）

### -C

切换到指定目录

### -c

创建新tar文档

### -u

更新tar文件

### -t

显示tar文件中的文件


##

tar -zcvf gzip压缩打包
