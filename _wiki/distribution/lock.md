---
layout: wiki
tags: [分布式锁]
---

```go
if redisConn.Do("set key_name nx ex 1") {

}
```


```go
// client1
redisConn.Do("watch key_name")
newval = doLogic()
redisConn.Do("multi")
redisConn.Do("set key_name " + newval)
if res := redisConn.Do("exec"); res == nil {
    // 锁已经被修改，这个时候应该
}
```