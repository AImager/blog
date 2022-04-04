---
layout: wiki
tags: [运行时]
---

## 最大核心数

```go
import (
	"fmt"
	"runtime"
)

func main() {

	runtime.GOMAXPROCS(1)

	a := 1

	go func() {
        for ; ; {
			a = 1
			for j:=0 ; j <= 1000000; j++ {
				a++
			}
			fmt.Println("go a ")
        }
	}()

    go func() {
		for ;; {
			fmt.Println(a)
		}
	}()

    select{}
}
```