---
layout: wiki
tags: [映射,字典,type]
---

map 在使用之前必须用 make 来创建；值为 nil 的 map 是空的，并且不能对其赋值。


```go
package main

import "fmt"

func main() {
    a := make(map[string]map[string]int)
    a["a"] = map[string]int{"c": 1}
    a["a"]["d"] = 2
    fmt.Println(a)
}


if _, ok := map[key]; ok {
//存在
}
```