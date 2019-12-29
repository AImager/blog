---
layout: wiki
tags: [集合]
---

`OBJ_ENCODING_INTSET`、`OBJ_ENCODING_HT`

集合和散列表有一定的相似性（都是通过散列表实现的？存疑），基本单元素操作时间复杂度都是O(1)。

比较来看，集合没有value，多了集合相关的操作。

## 集合

字符串类型的无序集合，集合成员是唯一的。

```shell
# 将成员添加到集合
# O(N)， N 是被添加的元素的数量
# 单个复杂度为O(1)
sadd key member [member ...]
```