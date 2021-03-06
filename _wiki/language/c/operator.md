---
layout: wiki
tags: [运算符]
---

共44个运算符，以下按优先级排序，从上往下优先级降低，同级相等，第一个括号里的表示结合性，第二个括号里的表示个数。

* 初等运算符（左到右）（4）：`( )`   `[ ]`   `.`   `->（连接指针变量与结构体成员）`
* 单目运算符（右到左）（9）：`!`   `~（位反）`   `++`   `--`   `-`   `*`   `&`   `sizeof`  `( )（用于强制类型转换）`
* 算数运算符（左到右）（3）：`*`   `/`   `%`
* 算数运算符（左到右）（2）：`+`   `-`
* 位运算符（左到右）（2）：`<<（位左移）`   `>>（位右移）`
* 关系运算符（左到右）（4）：`>`   `>=`   `<`   `<=`
* 关系运算符（左到右）（2）：`==`   `!=`
* 位运算符（左到右）（1）：`&（位与）`
* 位运算符（左到右）（1）：`^（位异或）`
* 位运算符（左到右）（1）：`|（位或）`
* 逻辑运算符（左到右）（1）：`&&`
* 逻辑运算符（左到右）（1）：`||`
* 条件运算符（右到左）（1）：`?:（条件求值）`
* 赋值运算符（右到左）（11）：`=`   `+=`   `-=`   `*=`   `%=`   `>>=`   `<<=`   `&=`   `^=`   `|=`   `/=`
* 逗号运算符（左到右）（1）：`,（顺序求值）`

## 结合性

C标准中没有给出结合性的标准说明，不过一个比较正确的理解是『在一个表达式中，如果多个符号的优先级相同，那就按结合性选择运算顺序』，如a=b=c，=是从右下向左的结合性，所以先算后面的=再算前面的。

## 求值顺序

和求值顺序有关的只有以下四个运算符

* `&&`  先算左边，左边为True时算右边，为False则忽略右边
* `||`  先算左边，左边为False时算右边，为Ture则忽略右边
* `,`   先算左边，算完后扔掉值再算右边
* `?:`  先算最前面，结果为True就算中间，False就算后面

## ++

++前缀先算，后缀如果在混合运算中，先忽略掉，即直接算混合运算，混合运算算完后再进行单独的后缀运算，++必须紧跟值而不能跟表达式。