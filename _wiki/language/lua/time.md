---
layout: wiki
tags: [时间,日期]
---

```lua
-- 日期得到时间戳
os.time({day=17, month=5, year=2012, hour=0, minute=0, second=0})
-- 时间戳转日期
os.date("%Y%m%d%H",t)
```