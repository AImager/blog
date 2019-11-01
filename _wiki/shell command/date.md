---
layout: wiki
tags: [日期,时间]
---

## 实例

```shell
# 查看当前日期，格式化成常用的标准形式
date '+%Y-%m-%d %H:%M:%S'

# 查看下周这个时间刻的时间戳
date --date='next week' '+%s'

# 查看10天前的年份、第几周、星期几
date --date='10 day ago' '+%Y %W %A'
```
