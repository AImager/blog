---
layout: wiki
tags: [parser,lexer]
---

```go
package main

import (
	"bytes"
	"fmt"
	"go/ast"
	"go/parser"
	"go/printer"
	"go/token"
)

func main() {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, "./demo.go", nil, parser.ParseComments)
	if err != nil {
		return
	}
	// 打印语法树
	ast.Print(fset, f)
	var buf bytes.Buffer
	printer.Fprint(&buf, fset, f)
	fmt.Println(buf.String())
}
```


## 参考链接

* [golang深入源代码系列之一：AST的遍历](https://studygolang.com/articles/19353)