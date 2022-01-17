---
layout: wiki
tags: [控制流]
---

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

```shell
if 
```

## if条件结构

```shell
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

```shell
# demo
if [[ "$app" = "" || "$branch" = "" || "$branch_ref" = "" ]];then
fi
```


## case条件结构

```shell
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

```shell
while [ condition ]
do
  expression
done
```


## until循环结构

```shell
until [condition]
do
  expression
done
```


## for循环结构

```shell
for var in con1 con2 ...
do
  expression
done
```


## 其它控制结构

```
<command_1> || <command_2>：或，command_1成功则跳过command_2，失败则执行command_2
<command_1> && <command_2>：与，command_1成功则执行command_2，失败则跳过
break n：跳出n层循环
continue n：继续n层循环
```