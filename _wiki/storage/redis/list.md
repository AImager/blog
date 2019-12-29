---
layout: wiki
tags: [栈,列表]
---

`OBJ_ENCODING_ZIPLIST`、`OBJ_ENCODING_LINKEDLIST`

## 列表

```shell
# 加入列表表头
# O(1)
lpush key value [value ...]

# 删除并获取表头第一个值，栈的形式
# O(1)
lpop key

# 根据索引取出数据
# O(S+N)， S 为偏移量 start ， N 为指定区间内元素的数量
lrange key start end
```