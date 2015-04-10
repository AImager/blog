---
title: Shell脚本基础参考手册
layout: post
tag: [Shell,参考手册,Linux]
---


## 环境变量

```
set：显示局部变量（包含所有全局变量）
unset：删除某个变量
echo：显示返回流中的字符串
export：自定义变量（不能被子进程使用）转换为环境变量
```


```
脚本独特命令：
    test：测试表达式，对返回0，错返回1，错误返回2
        -b：测试文件是否存在且是个块设备文件
        -c：测试文件是否存在且是个字符设备文件
        -d：测试文件夹是否存在
    eval：将当前子串当命令处理



其它控制结构
    <command_1> || <command_2>：或，command_1成功则跳过command_2，失败则执行command_2
    <command_1> && <command_2>：与，command_1成功则执行command_2，失败则跳过
    break n：跳出n层循环
    continue n：继续n层循环



if控制结构
    if expression ; then
        ...
    elif expression ; then
        ...
    elif expression ; then
        ...
    else
        ...
    fi


case控制结构
    case var in
    pattern1 | pattern2)  command1;;
    pattern3) command2;;
    *)   commands;;
    esac


for控制结构





脚本中特殊变量
    $0：当前程序的名称，实际上是一个内部参数
    $n：传递给脚本的第n个参数，n>=1
    $#：传递给程序的总的参数数目，也就是那个传说中的数组大小
    $?：上一个代码或者shell程序在shell中退出的情况，如果正常退出则返回0，反之为非0值。
    $*：传递给程序的所有参数组成的字符串。
    $$：本程序的(进程ID号)PID
    $!：上一个命令的PID





变量使用
    ""：表示不可分割的整体，处理$、`、\三种符号；对于\，其后只有在接$、`、"、\、换行符五种字符时才进行翻译
    ''：和双引号一样也是把包含的当作字符串处理，但其中的特殊字符不起作用
    ``：表示其中全当做命令处理
    ()：在本Shell中执行里面的命令
    {}：在子Shell中执行里面的命令
    $()：执行里面的命令，功能完全同``
    ${var}：解析变量，返回var的值
    ${var:-string}：var为空则返回string
    ${var:=string}：var为空则把string赋给var并返回var
    ${var:+string}：var非空时返回string
    ${var:?string}：var为空时string加入标准错误返回并退出
    ${var:n}：替换为从var从第n个字符开始的字符串
    ${var:n:length}：返回var从第n个字符开始长度为length的字符串
    ${#var}：返回var的长度







比较
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
