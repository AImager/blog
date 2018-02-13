---
title: hoisting
layout: wiki
category: javascript
tag: [变量提升]
---

## hoisting

hoisting翻译为变量名提升，指的是同一作用域内，变量的声明会提升到当前作用域首部。

```javascript
function test() {
	console.log(fee);	// undefined
	var fee = 1;
	foo(); // TypeError "foo is not a function"
	bar(); // "this will run!"
	var foo = function () { // function expression assigned to local variable 'foo'
		console.log("this won't run!");
	}
	function bar() { // function declaration, given the name 'bar'
		console.log("this will run!");
	}
}
test();
```

观察例子，`console.log(fee)`输出undefined而不是报错，是因为变量名提升导致`var fee`被提至开头，但声明提前而赋值并不会提前，所以不会报错也不会输出1，而是undefined。

匿名函数赋值不是声明的一部分，但`function name() {}`的形式正相反，这也是为什么例子中foo()报错而bar()有输出的原因。

## 参考链接

* [什么是Javascript Hoisting?](http://www.cnblogs.com/isaboy/p/javascript_hoisting.html)
* [JavaScript Scoping and Hoisting](http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html)