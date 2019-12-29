---
layout: wiki
tags: [散列表]
---

`OBJ_ENCODING_HT`、`OBJ_ENCODING_ZIPLIST`

## 哈希

哈希更节省内存，而且其结构对单一key而言类似于关联数组，所以很适合用户信息这样的场景。

```shell
# 设置key的field字段值
# O(1)
hset key field value

# 获取key的field字段值
# O(1)
hget key field
```