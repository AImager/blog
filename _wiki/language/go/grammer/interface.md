---
layout: wiki
tags: [接口]
---

go的接口和传统面向对象语言的实现不同，go将接口的实现和interface完全解耦。

go里面的interface很精简，没有implent等关键字。

从go的interface设计来看，其核心作用即限定实现方，因此当实现方不包含接口的所有函数时，就会出错。例如，以下代码编译会出错。

```go
package main

import (
    "fmt"
)

type Sorter interface {
    Len() int
    Less(i, j int) bool
    Swap(i, j int)
    Test() int
}
type Xi []int
type Xs []string

func (p Xi) Len() int               { return len(p) }
func (p Xi) Less(i int, j int) bool { return p[j] < p[i] }
func (p Xi) Swap(i int, j int)      { p[i], p[j] = p[j], p[i] }
func (p Xi) Test() int              { return len(p) }

func (p Xs) Len() int               { return len(p) }
func (p Xs) Less(i int, j int) bool { return p[j] < p[i] }
func (p Xs) Swap(i int, j int)      { p[i], p[j] = p[j], p[i] }

func Sort(x Sorter) {
    for i := 0; i < x.Len()-1; i++ {
        for j := i + 1; j < x.Len(); j++ {
            if x.Less(i, j) {
                x.Swap(i, j)
            }
        }
    }
}

func main() {
    ints := Xi{44, 67, 3, 17, 89, 10, 73, 9, 14, 8}
    strings := Xs{"nut", "ape", "elephant", "zoo", "go"}
    Sort(ints)
    fmt.Printf("%v\n", ints)
    Sort(strings)
    fmt.Printf("%v\n", strings)
}
```