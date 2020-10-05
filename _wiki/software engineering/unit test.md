---
layout: wiki
tags: [ut,单元测试]
---

## Go单测

```go
import (
	"fmt"

	"github.com/prashantv/gostub"
)

func main() {
	var test1mock = test1

	gostub.StubFunc(&test1mock, "test2")

	test1mock()
}

func test1() {
	fmt.Println("test1")
}

func test2() {
	fmt.Println("test2")
}
```

## 参考链接

* [如何得知golang代码覆盖率](https://studygolang.com/articles/10242)