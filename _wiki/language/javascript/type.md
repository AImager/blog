---
layout: wiki
tag: [类型]
---

* 原始类型
	* 数值
	* 字符串
	* 布尔值
	* undefined
	* null
* 复合类型
	* object
	* 函数
	* 数组


## 一切皆对象？

为什么这么问？看下面的例子

```javascript
var a = "sadfasf";
console.log(a.length);
```

例子中a赋值的是字符串原始值类型，为何可以使用length属性值？难道a也是对象？这篇[文章](http://www.cnblogs.com/myvin/p/4660138.html)很好的解释了这个问题。简单说就是a依旧是原始值类型，但在使用的时候，会将其包装成一个String对象使用。

