---
title: mongodb
layout: wiki
category: tool
tags: [mongo,nosql]
---

## shell命令

```shell
# 导出collection数据到file.json
mongodump -d db -c collection --host url:port --authenticationDatabase auth_db -u username -p password -o file.json

# 从file.json导入数据
mongorestore -d db -c collection --host url:port --authenticationDatabase auth_db -u username -p password file.json
```

## 运维指令

```shell
# 切换database
use dw;

# 当前服务状态
db.serverStatus()

# 当前数据库信息
db.stat()

# 当前操作命令
db.currentOp()

# 获取当前profile开启信息
db.getProfilingStatus()

# 开启profile级别，0为关闭，1为慢查询，默认100ms
db.setProfilingLevel(1,200)

# 查询大于5000ms来自于collection_name的查询
db.system.profile.find({ns : "collection_name", millis : {"$gt": 5000}})

# 获取可修改的配置信息
db.runCommand({getParameter: '*'});

# 修改配置，更多配置信息需要在config-file里面修改，比如超时配置项security.ldap.timeoutMS
db.runCommand({setParameter:});

# 删
db.collection.deleteMany()
db.collection.deleteOne()
```


## query

```shell
# in
{ status: { $in: [ "A", "D" ] } }
```


## php_driver

```shell
# php设置超时毫秒数
new MongoClient($uri, array("socketTimeoutMS" => "90000"))
```
