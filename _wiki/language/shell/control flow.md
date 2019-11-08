---
layout: wiki
tags: [控制流]
---

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