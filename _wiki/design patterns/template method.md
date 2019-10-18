---
title: template method
layout: wiki
category: design patterns
tags: [模板方法,行为型]
---

模板方法用于保证同一接口/抽象类的多个实现的某个行为步骤不变，但是每个步骤的具体行为可子类自己确定。比如对于角色抽象类都有着装的过程，且着装过程均是穿上装、穿下装、穿鞋，但是具体的着装不同角色不一样。这个例子不太好，不过已经表达意思了。

## php实现

```php
abstract class Role {
    abstract public function dress_tops();
    abstract public function dress_bottoms();
    abstract public function dress_shoes();

    final public function dress() {
        $this->dress_tops();
        $this->dress_bottoms();
        $this->dress_shoes();
    }
}

class Man extends Role {
    public function dress_tops() {
        echo "shirts";
    }

    public function dress_bottoms() {
        echo "pants";
    }

    public function dress_shoes() {
        echo "leather shoes";
    }
}

class Woman extends Role {
    public function dress_tops() {
        echo "skirts";
    }

    public function dress_bottoms() {
        echo "skirts";
    }

    public function dress_shoes() {
        echo "heels";
    }
}

$man = new Man;
$man->dress();
```

下面是go语言实现（并不优雅，关于这块的讨论参考我的一篇文章）

```go
package main

import (
	"fmt"
)

type Base struct {
	this I
}

type ChildA struct {
	*Base
}

type ChildB struct {
	*Base
}

type I interface {
	Init(I)         // final
	FinalTemplate() // final
	test()
}

func (t *Base) Init(i I) {
	t.this = i
}

func (t *Base) FinalTemplate() {
	fmt.Println("Base-Before")
	t.this.test()
	fmt.Println("Base-After")
}

func (t *Base) test() {
	fmt.Println("Base")
}

func (t *ChildA) test() {
	fmt.Println("ChildA")
}

func (t *ChildB) test() {
	fmt.Println("ChildB")
}

func FactoryChild(name string) (child I) {
	switch name {
	case "A":
		child = &ChildA{&Base{}}
	case "B":
		child = &ChildB{&Base{}}
	}
	child.Init(child)
	return
}

func main() {
	child := FactoryChild("A")
	child.FinalTemplate()
}
```