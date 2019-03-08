---
title: virtual
layout: wiki
category: cpp
tags: [虚函数]
---

虚函数，C++运行时多态实现的基础，编译时多态基于重载实现。

```cpp
#include <iostream>
using namespace std;

class Base{
public:
  virtual void func(int n) {
      cout << n;
  };
};

class Derive_Class : public Base{
public:
  virtual void func(int n) {
    cout << n+1;
  };
};

int main () {
    Base * q = new Derive_Class;
    q->func(2);
    return 0;
}
```


## 纯虚函数

形如`virtual void funtion()=0`的定义即为纯虚函数，即不给定实现。其逻辑和JAVA、PHP的接口interface一样。