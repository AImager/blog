---
layout: wiki
tags: [居中]
---


## text-align

```html
<p style="text-align:center">text</p>
```

设置文字『text』在p盒子的content区域居中。


## margin

```html
<div class="test-div">
  <img src="user.jpg" alt="user" style="display: block; margin: 0 auto;">
</div>
```

img元素相对于div元素居中。


## table-cell + vertical-align

```html
<div style="height: 100px; display: table-cell; vertical-align: middle;">
  居中元素
</div>
```

垂直居中

## absolute + margin

```html
<div>
  <div style="position: absolute; left: 0; right: 0; top: 0; bottom: 0; margin: auto;">
    居中元素
  </div>
</div>
```


## absolute + translate

```html
<div style="position: relative">
  <div style="position: absolute; transform: translate(-50%; -50%);">
    居中元素
  </div>
</div>
```


## flexbox

```html
<!--  2009兼容写法，不同浏览器加兼容前缀  -->
<div style="display: box; box-align: center; box-pack: center;">
  居中元素
</div>

<!--  标准写法  -->
<div style="display: flex; align-items: center; justify-content: center;">
  居中元素
</div>
```



## 参考链接

* [CENTERING THINGS](https://www.w3.org/Style/Examples/007/center.en.html)
