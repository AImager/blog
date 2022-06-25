---
layout: wiki
tags: [指针]
---

## 结构体指针

```go
package main

import "fmt"

type Vertex struct {
    X int
    Y int
}

func main() {
    v := Vertex{1, 2}
    p := &v
    p.X = 1e9
    fmt.Println(p.X)       // 1000000000
    fmt.Println((*p).X)     // 1000000000
}
```

`p.X`和`(*p).X`为什么一样？