---
layout: wiki
tags: [配置]
---

5.7.18以后安装目录和安装包里就不再包含my-default.cnf。所有的配置项见[Server Option and Variable Reference](https://dev.mysql.com/doc/refman/5.7/en/mysqld-option-tables.html)。

关于上面地址中6列标题的说明：

* Cmd-Line: 命令行能使用的参数，使用shell命令`mysqld --verbose --help`可查看
* Option File: 能在文件中配置的参数
* System Var: 系统变量，通过`SHOW VARIABLES;`查看，也可以使用shell命令`mysqladmin variables`
* Status Var: 状态变量，通过`show status;`查看，也可以使用shell命令`mysqladmin extended-status`
* Var Scope: 变量的影响状态，global表示只能做全局变量，session表示只能做会话变量，both表示都可以
* Dynamic: 运行时变量是否可改变

下面是常用于设置和获取信息的相关命令

* `set global variable = value;`: 设置全局变量
* `set session variable = value;`: 设置会话变量

## Connection

```shell
# 最大连接数
max_connections
```

## Timeout

```shell
# 连接过程中握手的超时时间
connect_timeout

# 不活跃的连接超时时间——交互模式下（单位：s）
interactive_timeout

# 不活跃的连接超时时间——非交互模式下（单位：s）
wait_timeout

# 接收客户端数据的超时时间（单位：s）
net_read_timeout

# 输出数据到客户端的超时时间（单位：s）
net_write_timeout

#
delayed_insert_timeout

#
innodb_flush_log_at_timeout

# innodb锁等待超时时间（单位：s）
innodb_lock_wait_timeout

# 锁等待时间（单位：s）
lock_wait_timeout

#
slave_net_timeout
```

## Query Cache

Query Cache建议关闭，因为QC的失效策略比较蛋疼，且只有在单一简单的业务查询下，整体性能才会有比较明显的优化。

```shell
# 关闭query cache
query_cache_type=off

# 设置query cache大小为0
query_cache_size = 0
```



