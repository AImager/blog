---
layout: wiki
tag: [shell]
---


## if条件结构

```bash
if [ condition ] ; then
  ...
elif [ condition ] ; then
  ...
elif [ condition ] ; then
  ...
else
  ...
fi
```


## case条件结构

```bash
case var in
  "pattern1")
    command1;;
  "pattern2")
    command2;;
  *)
    command3;;
esac
```


## while循环结构

```bash
while [ condition ]
do
  expression
done
```


## until循环结构

```bash
until [condition]
do
  expression
done
```


## for循环结构

```bash
for var in con1 con2 ...
do
  expression
done
```


## function结构

```bash
function name(){
  expression
  ...
}
```

## 其它控制结构

```
<command_1> || <command_2>：或，command_1成功则跳过command_2，失败则执行command_2
<command_1> && <command_2>：与，command_1成功则执行command_2，失败则跳过
break n：跳出n层循环
continue n：继续n层循环
```



## 脚本中特殊变量

```
$0：当前程序的名称，实际上是一个内部参数
$n：传递给脚本的第n个参数，n>=1
$#：传递给程序的总的参数数目，也就是那个传说中的数组大小
$?：上一个代码或者shell程序在shell中退出的情况，如果正常退出则返回0，反之为非0值。
$*：传递给程序的所有参数组成的字符串。
$$：本程序的(进程ID号)PID
$!：上一个命令的PID
```




## 变量使用

```
""：表示不可分割的整体，处理$、`、\三种符号；对于\，其后只有在接$、`、"、\、换行符五种字符时才进行翻译
''：和双引号一样也是把包含的当作字符串处理，但其中的特殊字符不起作用
``：表示其中全当做命令处理
()：在本Shell中执行里面的命令
[]：判断符号，在bash中使用方括号进行判断的时候，最好在左右、等号等处加上空格；在方括号中的变量最好用双引号引起来；常量最好用单引号或双引号引起来
{}：在子Shell中执行里面的命令
$()：执行里面的命令
${var}：解析变量，返回var的值
${var:-string}：var为空则返回string
${var:=string}：var为空则把string赋给var并返回var
${var:+string}：var非空时返回string
${var:?string}：var为空时string加入标准错误返回并退出
${var:n}：替换为从var从第n个字符开始的字符串
${var:n:length}：返回var从第n个字符开始长度为length的字符串
${#var}：返回var的长度
$((expression))：计算公式
```


## 比较

```
数值比较
  -eq：相等
  -ge：大于等于
  -gt：大于
  -le：小于等于
  -lt：小于
  -ne：不等于

字符比较
  =：等于
  !=：不等
  >：大于
  <：小于
  -n：长度是否非0
  -z：长度是否为0

文件比较
  -d：文件是否存在且是个目录
  -e：是否存在
  -f：是否存在且是文件
  -r：是否存在且可读
  -s：是否存在且非空
  -w：是否存在且可写
  -x：是否存在且可执行
  -0：是否存在且属于当前用户
  -G：是否存在且其所在组和当前用户相同
  -nt：检验file1是否比file2新
  -ot：检验file1是否比file2旧
```



## 命令、管道与I/O

```
声明：下面在描述命令的时候，[]表示可选的参数，<>表示必须的参数

command [-option] [stream]：处理命令+处理方式+处理对象，一般命令格式
command_1 | command_2 | command ...：从左往右执行命令，结果作为下一条命令的输入

>：输出重定向，定向文件时会将信息覆盖到文件
>>：输出重定向，定向文件时会将信息写到文件末尾
<：输入重定向，一般定向文件，读取文件信息
<<：输入实时重定向，如何用看例子
\：命令分段

例子：
cat > catfile << "eof"  # 手动输入，直到输入eof时结束，将输入的内容写到catfile
```



## 通配符

```
/：选定文件层次分隔
..：选定上一层目录
.：选定当前目录
~：选定当前用户目录，加用户名跳转到相应用户主文件夹
-：选定前一个目录
*：通配任意长度任意字符
？：通配一个任意字符
^：对条件取反
[]：里面的语句用于单个字符的判断
[:digit:]：匹配数字，等同于0-9，所以匹配一个数字为[[:digit:]]
[:lower:]：匹配小写字母
[:upper:]：匹配大写字母
[:alnum:]：英文大小写及数字
[:alpha:]：英文大小写
[:blank:]：空格与Tab
[:cntrl:]：控制按键
[:graph:]：除空格与Tab外的所有键
[:print:]：任何可被打出的字符
[:punct:]：标点
[:space:]：任何可产生空白的字符
[:xdigit:]：16进制数字
```
