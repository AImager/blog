---
layout: wiki
tags: [原子操作]
---

## CompareAndSwapInt32

```go
func CompareAndSwapInt32(addr *int32, old, new int32) (swapped bool)
```

仅当此判断得到肯定的结果之后，该函数才会用参数new代表的新值替换掉原先的旧值。否则，后面的替换操作就会被忽略。