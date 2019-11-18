---
layout: wiki
tags: [键值]
---

## 通用命令

```shell
# 匹配搜索后缀为_name的key，这个命令只支持*、？、[]三种通配符
# O(N)， N 为数据库中 key 的数量
keys *_name

# 获取key的超时时间
ttl key

# 对列表、集合、有序集合排序
sort key

# 显示100个匹配p_*的key
SCAN 0 COUNT 100 MATCH p_*
```