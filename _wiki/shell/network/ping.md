---
layout: wiki
tags: [icmp]
---

## 实例

```shell
# ping 10.211.55.0网段的广播地址
# 会收到所有网段内地址的回复
# mac不支持该用法
ping -b 10.211.55.255
```


### -b

ping广播地址