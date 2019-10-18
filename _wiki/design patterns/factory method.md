---
layout: wiki
tags: [工厂方法,创建型,模式]
---

通过参数生成指定的实例。

## php实现

```php
class A {
    public function test() {
        echo "I am A";
    }
}

class B {
    public function test() {
        echo "I am B";
    }
}

function factory($param) {
    switch($param) {
        case 'A':
            return new A();
        case 'B':
            return new B();
    }
};

$instance = factory('A');

$instance->test();
```


## java实现

```java
/* A.java */
public interface FactoryInterface {
    public void test();
}

/* B.java */
public class B implements FactoryInterface {
    @Override
    public void test() {
        System.out.println("this is B!");
    }
}


/* C.java */
public class C implements FactoryInterface {
    @Override
    public void test() {
        System.out.println("this is C!");
    }
}


/* Factory.java */
public class Factory {
    public FactoryInterface produce(String type) {
        if ("B".equals(type)) {
            return new B();
        } else if ("C".equals(type)) {
            return new C();
        } else {
            System.out.println("please input correct type!");
            return null;
        }
    }
}

/* FactoryTest.java */
public class FactoryTest {
    public static void main(String[] args) {
        Factory factory = new Factory();
        FactoryInterface instance = factory.produce("B");
        instance.test();
    }
}
```

可以从PHP和JAVA实现方式的不同上看出，动态语言PHP写起来方便的多，原因是静态语言需要通过继承接口才能实现多态。