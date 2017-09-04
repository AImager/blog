---
title: css selector
layout: wiki
category: web layout
tags: [选择器]
---

## 实例

~~~Text
/* .menu-main后代元素里，若某li元素是其父元素的第2个子元素，则筛选出来 */
.menu-main li:nth-child(2)

/* .menu-main后代元素里，若某li元素是其父元素的第2个li子元素，则筛选出来 */
.menu-main li:nth-of-type(2)

/* title属性值里含有"name"单词的元素，单词按空格分割 */
[title~=name]

/* title属性值里含有"name"字符串的元素 */
[title*=name]

/* target属性等于"_blank"的元素 */
[target=_blank]
~~~


## 参考链接

* [CSS选择器参考手册](http://www.w3school.com.cn/cssref/css_selectors.asp)
