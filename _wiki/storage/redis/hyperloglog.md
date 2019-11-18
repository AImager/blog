---
layout: wiki
tags: [模糊统计]
---


## HyperLogLog

用于做模糊`count(distinct)`的结构，速度快，内存占用小。

```shell
# 添加元素进去
pfadd key element

# 统计数量
pfcount key
```