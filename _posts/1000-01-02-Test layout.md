---
title: 排版测试二
layout: post
tags: [test,测试]
typora-root-url: ../../blog
---

Similarly, don't start with the idea that jQuery does X, Y, and Z, so I'll just add AngularJS on top of that for models and controllers. This is really tempting when you're just starting out, which is why I always recommend that new AngularJS [^1] developers [^2] don't use jQuery [^3] at all [^4], at least until they get used to doing things the "Angular Way".

## Chapter1

### Chapter2

Similarly, don't start with the idea that jQuery does X, Y, and Z, so I'll just add AngularJS on top of that for models and controllers. This is really tempting when you're just starting out, which is why I always recommend that new AngularJS developers don't use jQuery at all, at least until they get used to doing things the "Angular Way".

I've seen many developers here and on the mailing list create these elaborate solutions with jQuery plugins of 150 or 200 lines of code that they then glue into AngularJS with a collection of callbacks and $applys that are confusing and convoluted; but they eventually get it working! The problem is that in most cases that jQuery plugin could be rewritten in AngularJS in a fraction of the code, where suddenly everything becomes comprehensible and straightforward.

The bottom line is this: when solutioning, first "think in AngularJS"; if you can't think of a solution, ask the community; if after all of that there is no easy solution, then feel free to reach for the jQuery. But don't let jQuery become a crutch or you'll never master AngularJS.


![](/media/.img/Git_areas.png)

## 章节二

首先看中间的 $\left \lfloor \frac{y}{17} \right \rfloor 2^{-17 \left \lfloor x \right \rfloor - mod(\left \lfloor y \right \rfloor , 17)}$ 部分（暂且命名这个部分为Section），即类似于 $m*2^{k}$ 这种形式，了解二进制的人都会意识到，当 $k$ 为正数的时候，其结果就是将 $m$ 的二进 [^5] 制值左移 $k$ 位，而当 $k$ 小于0的时候，则是将 $m$ 的二进制值右移 $k$ 位，同时，如果 $m$ 的值不变， $k$ 的值顺序减小，那么得到值的将会是一串顺序右移的数；接着，公式又将Section对2取模，显然结果不是0就是1，而这个值刚好就是Section结果的最后一位；Ok，到此你应该理解了，其实公式右边就是不断得到 $\left \lfloor \frac{y}{17} \right \rfloor$ 中的二进制位，而且还是顺序的，不过它和图像由什么关系呢？其实这就是 $N$ 的意义了，你会发现 $\frac{N}{17}$ 刚好为整数，而得到的这个整数刚好是图像对应二进制数表示的十进制值（图像转换的二进制值是依据从左向右、从下向上的顺序得到的），所以 $\left \lfloor \frac{y}{17} \right \rfloor$ 的一串值刚好就是图像中的对应点（1表示黑色，0表示无），从而得到的就刚好是公式本身。

```c
// 这是C代码段

#include <stdio.h>

int main(){
  printf("%s","nihao");
  return 0;
}
```

```python
# 这是Python代码段

import time

def ungzip(data):
  try:        # 尝试解压
    print('正在解压.....')
    data = gzip.decompress(data)
    print('解压完毕!')
  except:
    print('未经压缩, 无需解压')
  return data
```

这是测试一个内块的文段，先是英文`hello`，再是中文`你好`，然后是重复；这是测试一个斜体的文段，先是英文*hello*，再是中文*你好*，然后是重复；这是测试一个粗体的文段，先是英文**hello**，再是中文**你好**，然后是重复；



```javascript
// 这是个JavaScript的代码段

function fbLogin() {
  chrome.storage.local.set({'value': '123'},function(){
    chrome.storage.local.get("value", function(item){
      document.getElementById("cong").innerHTML=item.value
    })
  })
}

var test = document.getElementById('test');
test.addEventListener('click', fbLogin);
```

## 区块

### 三级标题

下面来看看区块，下面有空行的和不空行的，理论上递增都行，但递减就只有前面那种能行。

> 这里完成一个嵌套区块
>
>> 内一层
>>
>>> 内二层，这只是一个循环，用于观察blockquote的段落排版；内二层，这只是一个循环，用于观察blockquote的段落排版；内二层，这只是一个循环，用于观察blockquote的段落排版；内二层，这只是一个循环，用于观察blockquote的段落排版；
>>
>> 内一层
>
> 外层
>
>> * 试试列表
>>
>>   * 二级列表
>>
>>     * 三级列表
>>
>> * 数学
>>
>> * 计算机





## 序列

来看看下面的列表模块

* 计算机
    * 算法
        * ACM
        * 智能算法
        * 数据挖掘
* 数学
    * 数论
    * 模糊
    * 拓扑
    * 混沌理论

---

## 数值序列


1. 计算机
2. 数学
    1. 分析
    2. 几何

![](/media/.img/Git_areas.png)


|    这是表格    | 这是标题行   | 标题会加粗 |
| :------------: | :----------- | ---------: |
|      居中      | 居左默认     |       居右 |
| -的数量至少为3 | 没其他要求了 |     就这样 |

```java
// 这是Java代码段

public class HelloWorld{
  public static void main(String args[]){
    System.out.println("Hello World!");
  }
}
```

## 제3장

式のコア原則は理解しています、それの17の意味は何ですか？ 図をよく見ると、17は実際に制御可能な画像の幅であり、Nに対応する式はN = 17 * imageの2進表現です。 したがって、実際の状況では、画像の決定後にNの値が計算されます。 式の構成とN値の決定を理解する理論的には、画像の範囲（N値）を決定し、同時に式を決定する限り、特定の式画像の特定の位置に必要な画像を見つけることができます。 指定された式の下で欲しい画像を取得します。 最後に、画像を見つけるための一般式が与えられます（Mは小数部分を区別する識別子、L、Hは画像の長さと高さです）

$$
\begin{cases}
M < \left \lfloor mod({\left \lfloor \frac{y}{H} \right \rfloor 2^{-H\left \lfloor x \right \rfloor - mod(\left \lfloor y \right \rfloor , H)} , 2 }) \right \rfloor   \\
0 \leq x \leq L  \\
N \leq y \leq N+H-1  \\
0 < M < 1
\end{cases}
$$

## 参考链接

* [FastCGI Specification](https://web.archive.org/web/20160119141816/http://www.fastcgi.com/drupal/node/6?q=node%2F22#S1)
* [式のコア原則](http://wiki.c2.com/?CgiVsServlet)
* [没其他要求了](http://wiki.c2.com/?CgiVsServlet)

## 脚注

[^1]: [RFC3875 CGI](https://www.rfc-editor.org/info/rfc5280)
[^2]: [FastCGI](http://www.php-internals.com/book/?p=chapt02/02-02-03-fastcgi)
[^3]: [没其他要求了](http://wiki.c2.com/?CgiVsServlet)
[^4]: 这里表示的是巴拉巴拉，式のコア原則は理解しています、それの17の意味は何ですか，知道了吗
[^5]: [式のコア原則](http://wiki.c2.com/?CgiVsServlet)