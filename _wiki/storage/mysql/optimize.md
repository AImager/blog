---
title: optimize
layout: wiki
category: mysql
tags: [优化,explain,profiling,trace]
---

## profiler分析

```sql
-- 开启sql分析
SET profiling = 1;

-- 查看profiling的设置状态
SELECT @@profiling;

-- 查看所有已经分析了的query
SHOW PROFILES;

-- 查看query序号为4的数据
SHOW PROFILE ALL FOR QUERY 4;
```


## trace分析

```sql
-- 设置开启trace
SET OPTIMIZER_TRACE="enabled=on";
-- 设置最大optimizer内存
SET OPTIMIZER_TRACE_MAX_MEM_SIZE=1000000;
-- 设置记录的sql数
SET optimizer_trace_limit = 1;

-- 设置完成并运行sql后，执行得到trace字段
-- trace字段为json格式的详细trace分析
select TRACE from information_schema.OPTIMIZER_TRACE;
```