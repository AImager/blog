---
layout: wiki
tags: [视图]
---

```shell
# 创建视图
create view view_name (field1, field2) as SQL;
```

## 优势

* 隔离安全性，不过这种安全性在对外开放的数据库意义更明显
* 复杂SQL语义化，业务逻辑更清晰
* 复用以简化操作