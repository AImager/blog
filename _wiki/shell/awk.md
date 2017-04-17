---
title: awk
layout: wiki
category: shell
tags: [文本处理]
---


## 实例

~~~Text
# 分组统计次数
awk '{a[$1]++}END{for (j in a) print j","a[j]}'
~~~

### -F

通过符号划分数据流

## 参考链接

* [The GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html)
