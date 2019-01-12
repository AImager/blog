---
layout: wiki
tags: [scheme, racket]
---

## Too many levels of symbolic links

使用ln命令将racket放到PATH指定的目录时，源路径必须使用完整地址，否则直接执行`racket test.rkt`的时候会报错误。