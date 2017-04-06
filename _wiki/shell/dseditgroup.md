---
title: dseditgroup
layout: wiki
category: shell
tags: [mac,group,添加,修改]
---

## 实例

~~~Text
# 添加wireshark用户组
dseditgroup -o create wireshark

# 将用户cong加到wireshark用户组里面去
dseditgroup -o edit -a cong -t user wireshark
~~~
