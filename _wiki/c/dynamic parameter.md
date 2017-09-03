---
title: dynamic parameter
layout: wiki
category: c
tags: [变长参数]
---


~~~C
#include <stdarg.h>

type operName(type firstarg, ...){
    va_list ptr;
    va_start(ptr, firstarg);
    va_arg(ptr,nexttype);    //切换到下一个参数，返回下一个参数的值
    va_end(ptr);
}
~~~