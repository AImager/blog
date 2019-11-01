---
layout: wiki
tags: [文本处理]
---

## 功能描述

`awk 'BEGIN{ begin_commands } pattern{ commands } END{ end_commands }' file`

轮询开始前执行begin_commands，然后根据pattern进行数据过滤，接着轮询每一行执行commands，轮询完后执行end_commands。

## 实例

```shell
# 分组统计次数
awk '{a[$1]++}END{for (j in a) print j","a[j]}'

# 相加求和，支持小数
awk '{sum += $1};END {print sum}'

# 使用shell变量
awk '{print "'"$var"'"}'
```

### -F

通过符号划分数据流

## 参考链接

* [The GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html)
