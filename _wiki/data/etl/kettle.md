---
layout: wiki
tags: [ETL]
---

## 使用

* 添加数据库驱动mysql-connector-java-X.X.XX-bin.jar到lib目录下


## kettle.properties设置

```
# 设置NULL和空字符串区别开
# 解决Column 'xxxx' cannot be null
KETTLE_EMPTY_STRING_DIFFERS_FROM_NULL=Y
```


## 数据库选项

```
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

# 设置游标流式读取数据以及每次读取的size
useCursorFetch=true
defaultFetchSize=1000
```

## 坑

下面是使用kettle中可能会遇到的坑

### net_write_timeout

1. 把net_write_timeout设大一些，
2. 如果第一种方法没有没有效果，则在mysql连接面板上，不选user result stream cursor选项。

### JavaScript组件

1. 使用isEmpty函数前要先判断!=null

### timeout

```
# 连接握手失败重试次数
maxReconnects=12

# 每次连接超时时间
initialTimeout=10

# 自动重连
autoReconnect=true


failOverReadOnly=false
connectTimeout=120000
socketTimeout=120000
```
