---
title: css selector
layout: wiki
category: web layout
tags: [选择器]
---

## 属性选择

~~~Text
/* title属性值里含有"name"单词的元素，单词按空格分割 */
[title~=name]

/* title属性值里含有"name"字符串的元素 */
[title*=name]

/* target属性等于"_blank"的元素 */
[target=_blank]
~~~

## 子元素

~~~Text
/* .menu-main后代元素里，若某li元素是其父元素的第2个子元素，则筛选出来 */
.menu-main li:nth-child(2)

/* .menu-main后代元素里，若某li元素是其父元素的第2个li子元素，则筛选出来 */
.menu-main li:nth-of-type(2)
~~~

nth-child/first-child等伪选择器修饰的元素至少是二级元素，如果前面还有父选择器，则至少是父选择器筛选后的二级元素。针对以下例子，如果想选择`li-1/4/7/10`，使用`.a li:first-child`，如果想选择`li-1/4/7`，使用`.a .first li:first-child`。

~~~html
<div class = 'a'>
  <div class = 'first'>
    <ul>
      <li>1</li>
      <li>2</li>
      <li>3</li>
    </ul>
    <ul>
      <li>4</li>
      <li>5</li>
      <li>6</li>
    </ul>
    <ul>
      <li>7</li>
      <li>8</li>
      <li>9</li>
    </ul>
  </div>
  <div class = 'second'>
    <li>10</li>
    <li>11</li>
    <li>12</li>
  </div>
</div>
~~~


## 参考链接

* [CSS选择器参考手册](http://www.w3school.com.cn/cssref/css_selectors.asp)
