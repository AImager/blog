---
layout: wiki
tags: [内存,gc]
---

## 函数

* memory_get_usage：用于获取当前程序实际占用的内存
* memory_get_peak_usage：用于获取系统分配给当前程序的内存

系统调用开销大，所以很多时候多malloc一些内存，以供程序使用，避免频繁的系统调用。
