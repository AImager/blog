---
layout: wiki
tags: [regular]
---

```go
package main

import (
    "bytes"
    "fmt"
    "regexp"
)

func main() {

    // func Match(pattern string, b []byte) (matched bool, err error)
    // 判断在 b 中能否找到正则表达式 pattern 所匹配的子串
    isMatch, _ := regexp.MatchString("p([a-z]+)ch", "peach")
    fmt.Println(isMatch) // true

    // 也可以这样编译后使用
    r, _ := regexp.Compile("p([a-z]+)ch")
    fmt.Println(r.MatchString("peach")) // true

    // func (re *Regexp) FindString(s string) string
    // 在 s 中查找 re 中编译好的正则表达式，并返回第一个匹配的内容
    fmt.Println(r.FindString("peach punch")) // peach

    // func (re *Regexp) FindStringIndex(s string) (loc []int)
    // 在 s 中查找 re 中编译好的正则表达式，并返回第一个匹配的位置
    // {起始位置, 结束位置}
    fmt.Println(r.FindStringIndex("peach punch")) // [0 5]

    // func (re *Regexp) FindStringSubmatch(s string) []string
    // 在 s 中查找 re 中编译好的正则表达式，并返回第一个匹配的内容
    // 同时返回子表达式匹配的内容
    // {完整匹配项, 子匹配项, 子匹配项, ...}
    fmt.Println(r.FindStringSubmatch("peach punch")) // [peach ea]

    // func (re *Regexp) FindStringSubmatchIndex(s string) []int
    // 在 s 中查找 re 中编译好的正则表达式，并返回第一个匹配的位置
    // 同时返回子表达式匹配的位置
    // {完整项起始, 完整项结束, 子项起始, 子项结束, 子项起始, 子项结束, ...}
    fmt.Println(r.FindStringSubmatchIndex("peach punch")) // [0 5 1 3]

    //func (re *Regexp) FindAllString(s string, n int) []string
    // 在 s 中查找 re 中编译好的正则表达式，并返回所有匹配的内容
    // {匹配项, 匹配项, ...}
    // 只查找前 n 个匹配项，如果 n < 0，则查找所有匹配项
    fmt.Println(r.FindAllString("peach punch pinch", -1))
    // [peach punch pinch]
    fmt.Println(r.FindAllString("peach punch pinch", 2))
    // [peach punch]

    // func (re *Regexp) FindAllStringSubmatchIndex(s string, n int) [][]int
    // 在 s 中查找 re 中编译好的正则表达式，并返回所有匹配的位置
    // 同时返回子表达式匹配的位置
    // {
    //     {完整项起始, 完整项结束, 子项起始, 子项结束, 子项起始, 子项结束, ...},
    //     {完整项起始, 完整项结束, 子项起始, 子项结束, 子项起始, 子项结束, ...},
    //     ...
    // }
    // 只查找前 n 个匹配项，如果 n < 0，则查找所有匹配项
    fmt.Println(r.FindAllStringSubmatchIndex(
        "peach punch pinch", -1))
    // [[0 5 1 3] [6 11 7 9] [12 17 13 15]]

    // func (re *Regexp) Match(b []byte) bool
    // 判断在 b 中能否找到匹配项
    fmt.Println(r.Match([]byte("peach"))) //true

    // func MustCompile(str string) *Regexp
    // MustCompile 的作用和 Compile 一样
    // 不同的是，当正则表达式 str 不合法时，MustCompile 会抛出异常
    // 而 Compile 仅返回一个 error 值
    r = regexp.MustCompile("p([a-z]+)ch")
    fmt.Println(r) // p([a-z]+)ch

    // func (re *Regexp) ReplaceAllString(src, repl string) string
    // 在 src 中搜索匹配项，并替换为 repl 指定的内容
    // 全部替换，并返回替换后的结果
    fmt.Println(r.ReplaceAllString("a peach", "<fruit>")) // a <fruit>

    // func (re *Regexp) ReplaceAllFunc(src []byte, repl func([]byte) []byte) []byte
    // 在 src 中搜索匹配项，然后将匹配的内容经过 repl 处理后，替换 src 中的匹配项
    // 如果 repl 的返回值中有“分组引用符”（$1、$name），则将“分组引用符”当普通字符处理
    // 全部替换，并返回替换后的结果
    in := []byte("a peach")
    out := r.ReplaceAllFunc(in, bytes.ToUpper)
    fmt.Println(string(out)) // a PEACH
}
```