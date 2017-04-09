---
title: kettle
layout: wiki
category: 30 minutes
tags: [ETL]
---


## kettle.properties设置

~~~Text
# 设置NULL和空字符串区别开
# 解决Column 'xxxx' cannot be null
KETTLE_EMPTY_STRING_DIFFERS_FROM_NULL=Y
~~~


## 数据库选项

~~~Text
# 日期返回0001-01-01 00:00:00.0
# 解决Value '0000-00-00' can not be represented
zeroDateTimeBehavior=round

# 日期返回NULL
# 解决Value '0000-00-00' can not be represented
zeroDateTimeBehavior=convertToNull

# 设置tinyint不转换为bool型
# 解决tinyint转换为bool型的问题
tinyInt1isBit=false

# 设置不转换为bool型
transformedBitIsBoolean=false

# 解决中文乱码
characterEncoding=utf-8

# 解决MySQL插入慢的问题
useServerPrepStmts=false
rewriteBatchedStatements=true
useCompression=true
~~~
