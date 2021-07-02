---
layout: wiki
tags: [参数分割]
---

## 功能描述

将串分割后作为参数传递给命令，方便重复执行命令，也可以避免单次命令超过shell下的最大长度。

xargs的默认命令是echo。

## 实例

```shell
# 将多行文件合并成一行输出
cat 1.txt | xargs

# 每次将5个命令项作为参数
cat 1.txt | xargs -n 5

# 寻找path下文件进行删除
find /path -type f -print0 | xargs -0 rm
```

## 参考链接

* [xargs 命令教程](http://www.ruanyifeng.com/blog/2019/08/xargs-tutorial.html)