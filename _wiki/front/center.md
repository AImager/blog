---
title: center
layout: wiki
category: front
tags: [居中]
---


## text-align

~~~HTML
<p style="text-align:center">text</p>
~~~

设置文字『text』在p盒子的content区域居中。


## margin

~~~HTML
<div class="test-div">
  <img src="user.jpg" alt="user" style="display: block; margin: 0 auto;">
</div>
~~~

img元素相对于div元素居中。

## absolute + margin

~~~HTML
<div>
  <div style="position: absolute; left: 0; right: 0; top: 0; bottom: 0; margin: auto;">
	居中元素
  </div>
</div>
~~~


## absolute + translate

~~~HTML
<div style="position: relative">
  <div style="position: absolute; transform: translate(-50%; -50%);">
	居中元素
  </div>
</div>
~~~


## box-align + box-pack

~~~HTML
<div style"display: -webkit-box; -webkit-box-align: center; -webkit-box-pack: center">
  <div style="display: block;">
	居中元素
  </div>
</div>
~~~



## 参考链接

* [CENTERING THINGS](https://www.w3.org/Style/Examples/007/center.en.html)
