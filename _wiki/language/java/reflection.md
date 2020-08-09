---
layout: wiki
tags: [反射]
---

反射是动态获取对象信息的能力。


## 动态代理

运行时动态的创建接口实例

```java
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Main {
    public static void main(String[] args) {
        InvocationHandler handler = new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                System.out.println(method);
                if (method.getName().equals("morning")) {
                    System.out.println("Good morning, " + args[0]);
                }
                return null;
            }
        };
        Hello hello = (Hello) Proxy.newProxyInstance(
            Hello.class.getClassLoader(), // 传入ClassLoader
            new Class[] { Hello.class }, // 传入要实现的接口
            handler); // 传入处理调用方法的InvocationHandler
        hello.morning("Bob");
    }
}

interface Hello {
    void morning(String name);
}

```


## 参考链接

* [什么是反射、反射可以做些什么](http://www.cnblogs.com/zhaopei/p/reflection.html)
* [反射 (计算机科学)](https://zh.wikipedia.org/wiki/%E5%8F%8D%E5%B0%84)
* [动态代理](https://www.liaoxuefeng.com/wiki/1252599548343744/1264804593397984)