---
layout: wiki
tags: [存储,拷贝,swap]
---

## 功能描述

用于拷贝存储内容，同时做适当的转换

## swap分配

添加swap虚拟分区需要以下三步

```
# 生成100M*10的虚拟空设备文件/tmp/swap1
dd if=/dev/zero of=/tmp/swap1 bs=100M count=10

# 生成交换分区文件/tmp/swap1
mkswap /tmp/swap1

# 激活交换分区
swapon /tmp/swap1
```

如果想swap分区失效，执行`swapoff /tmp/swap1`。

这种方式主要使用文件进行虚拟swap的分配，还有一种是直接分区，这需要磁盘分区，所以要么格式化，要么实用工具迁移数据，相比而言会麻烦些。