---
layout: wiki
tags: [导入导出]
---


## 数据导出

```shell
# dump导出db1里table1和table2的数据
mysqldump -u username -h host -p db1 table1 table2 > dump.sql
```

## 数据导入

```sql
-- 还原dump的数据
source dump.sql
```