---
layout: wiki
tags: [日志]
---

```shell
mysql> show binlog events in 'mysql-bin.000007' from 1190 limit 2\G
*************************** 13. row ***************************
   Log_name: mysql-bin.000007
        Pos: 1190   //事件起始pos点
 Event_type: Query  //事件类型
  Server_id: 123    //会话标识（恢复的时候也相当于过个会话进行恢复，避免出现数据不一致的情况）
End_log_pos: 1352   //结束pos点，下个事件的起点
       Info: use `test`; insert into tb_person  set name="name__2", address="beijing", sex="man", other="nothing"   //dml语句
*************************** 14. row ***************************
   Log_name: mysql-bin.000007
        Pos: 1352
 Event_type: Xid
  Server_id: 123
End_log_pos: 1383
       Info: COMMIT /* xid=51 */
```


## 模式

* Row
  * 说明: 能非常清晰的记录下每行数据的修改细节，不需要记录上下文相关信息，因此不会发生某些特定情况下的procedure、function、及trigger的调用触发无法被正确复制的问题，任何情况都可以被复制，且能加快从库重放日志的效率，可以完全保证从库数据的一致性。
  * 缺点: 由于所有的执行的语句在日志中都将以每行记录的修改细节来记录，因此，可能会产生大量的日志内容，干扰内容也较多；比如一条update语句，如修改多条记录，则binlog中每一条修改都会有记录，这样造成binlog日志量会很大，特别是当执行alter table之类的语句的时候，由于表结构修改，每条记录都发生改变，那么该表每一条记录都会记录到日志中，实际等于重建了表。
  * 注意: 新版本的MySQL对row level模式也被做了优化，并不是所有的修改都会以row level来记录，像遇到表结构变更的时候就会以statement模式来记录，如果sql语句确实就是update或者delete等修改数据的语句，那么还是会记录所有行的变更。
* Statement
  * 说明: 只需要记录执行语句的细节和上下文环境，避免了记录每一行的变化，在一些修改记录较多的情况下相比ROW level能大大减少binlog日志量，节约IO，提高性能；还可以用于实时的还原；同时主从版本可以不一样，从服务器版本可以比主服务器版本高。
  * 缺点: 为了保证sql语句能在slave上正确执行，必须记录上下文信息，以保证所有语句能在slave得到和在master端执行时候相同的结果；另外，主从复制时，存在部分函数（如sleep）及存储过程在slave上会出现与master结果不一致的情况。
* Mixed
  * 说明: 混合Row和Statement的模式，新版本Row已经尽量优化，可以直接使用Row。


## 主从复制

* 核心逻辑就是将binlog记录的sql重新在slave执行一遍（binlog不记录select）