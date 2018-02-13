---
title: scope
layout: wiki
category: javascript
tag: [作用域,闭包,var]
---

javascript的作用域等级为function-block level。

## var

var用于声明local变量，其在全局代码下不会产生作用域影响，但是var会触发变量名提升。

## 闭包

闭包的解释比较多，我倾向的解释为`函数能够访问外围环境里的自由变量`，那么基于此定义，javascript表现的闭包特性为：变量使用的时候在当前作用域未找到声明，于是到包含本作用域的外层作用域中寻找，逐层寻找直到全局作用域。

```javascript
var foo = 1;    // Global
fee = 1;    // Global

function test() {
    var fee = 2;    // Local
    function func() {
		console.log("foo " + foo);	// foo 1
        foo = 3;    // Global
		console.log("fee " + fee);	// fee 2
        fee = 3;    // use Closure
    }
    func();
    console.log("foo " + foo);	// foo 3
    console.log("fee " + fee);	// fee 3
}

test();

console.log("foo " + foo);	// foo 3
console.log("fee " + fee);	// fee 1
```

观察例子，`var fee = 2;`由于变量名提升，解析为`var fee; fee = 2;`，所以此时全局作用域和test作用域各有一个fee变量。func中的foo由于没有在本作用域声明，所以会使用闭包特性，最终调用的是全局的foo变量；而func中的fee同样没有在本作用域声明，最后使用的是test作用域下的fee变量。因此`foo = 3`修改的是全局的foo，而`fee = 3`修改的是test作用域下的fee。

### 坑

```javascript
for (var i = 0; i < 5; i++) {
    setTimeout(function () {
      console.log(i);
    }, 5);
}

// 输出
// 5
// 5
// 5
// 5
// 5
```

## 参考链接

* [闭包（计算机科学）是什么？](https://www.zhihu.com/question/24084277)
* [作用域与闭包](http://wiki.jikexueyuan.com/project/node-lessons/scope-closure.html)