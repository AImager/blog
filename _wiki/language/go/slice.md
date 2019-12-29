---
layout: wiki
tags: [切片,类型,type]
---

```go
// 切片，不定长
a := []int{1,2,3}

// 字符串转换成byte切片
b := []byte("abcs")

// byte切片转换切片成字符串
s := string(b)
```

切片有容量，容量决定了初始化分配的内存空间，append通过重新分配更大的空间进行容量调整，但这也意味着append实际上是很昂贵的操作 [^1]

slice 的零值是 nil 。

## 参考链接

* [Go Slices: usage and internals](https://blog.golang.org/go-slices-usage-and-internals)

## 脚注

[^1]: [How to use slice capacity and length in Go](https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go/)