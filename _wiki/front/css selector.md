---
title: css selector
layout: wiki
category: front
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
~~~
