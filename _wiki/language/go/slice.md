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

切片有容量，即最大不超过多少。注意，容量和长度不一样

slice 的零值是 nil 。