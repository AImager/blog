---
layout: wiki
tags: [日志]
---

```shell
#
(log:"IDsBySearchES" AND log:"1000592") OR (log:"params" AND  ts:>100) AND (NOT log:"Duplicate")
```

* AND: 与条件，必须大写
* OR: 或条件，必须大写
* NOT: 非条件，必须大写
* "": 精确匹配，不做分词
* *: 模糊匹配0到多个字符
* ?: 匹配单个字符
* +: 必须含有此项
* -: 必须不含此项