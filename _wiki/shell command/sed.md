---
title: sed
layout: wiki
category: shell command
tag: [反序,替换]
---

## 功能描述

文本流处理，关键是pattern space和hold space两个概念，衍生的是繁多的命令操作

## 实例

```shell
# 删除空行
sed '/^\s*$/d' text

# 反序文件行
# 1 !G表示除第一行外均执行G命令，$ !d表示除最后一行均执行d命令
sed '1 !G;h;$ !d' text

# 取文件第2到第6行
sed -n '2,6p' file

# 2~5行行首加入字符HEAD
sed '2,5 s/^/HEAD&/g' file

# 每两行做一次匹配
sed -n 'N;/^\n```$/p' file
```

### -f

使用sed命令脚本

### -n

禁止默认的pattern输出

### -e

一次匹配多个匹配命令

### -i

直接将命令效果作用于文件，一般最好不用这个参数

### 命令

```
p：打印匹配行
=：显示文件行号
a：在定位行号后附加新文本信息
i：在定位行号后插入新文本信息
d：删除定位行
c：用新文本替换定位文本
s：使用替换模式替换相应模式
{}：在定位行执行的命令组

g：将hold space中的内容拷贝到pattern space中，原来pattern space里的内容清除
G：将hold space中的内容append到pattern space\n后
h：将pattern space中的内容拷贝到hold space中，原来的hold space里的内容被清除
H：将pattern space中的内容append到hold space\n后
x：交换pattern space和hold space的内容

N：追加一行到pattern space中
```


## 参考链接

* [sed, a stream editor](https://www.gnu.org/software/sed/manual/sed.html)
* [sed命令n，N，d，D，p，P，h，H，g，G，x解析](http://blog.csdn.net/xiexingshishu/article/details/50514132)
