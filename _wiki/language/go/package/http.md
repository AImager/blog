---
layout: wiki
tags: [网络]
---

## cookie

```go
// 用来记录302跳转前的cookie
gCurCookieJar, _ := cookiejar.New(nil)
httpClient := http.Client{
	Jar: gCurCookieJar,
}
```


```go
// 重写302跳转方法
client.CheckRedirect = func(req *http.Request, via []*http.Request) error {
    // 返回这个错误会终止后续302跳转
    return http.ErrUseLastResponse
}
```