---
layout: wiki
tags: [打包,解压]
---

## 功能描述

打包命令，同时支持gzip和bzip2形式的解压缩『这两个也是主要的压缩方案』，所以只需要这个命令即可，需要注意的是，打包的信息中是包含文件的权限，但是记录的权限是uid和gid

## 实例

```
# gzip压缩打包
tar -zcvf outfile needcompress

# bzip2压缩打包
tar -jcvf outfile needcompress

# gzip解压缩
tar -zxvf outfile needcompress
```

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
