---
title: control statement
layout: wiki
category: c
tags: [控制语句]
---

## 条件控制

### if语句

```c
if (color > 2) {
    printf("red ");
} else if (color == 2) {
    printf("blue ");
} else {
    printf("yellow ");
}

/**
 * int color = 2;
 * output
 * blue
 */
```

### switch语句

```c
switch (color) {
  case 1: printf("red "); break;
  case 2: printf("black ");
  case 3: printf("blue ");
  default: printf("yellow ");
}

/**
 * int color = 2;
 * output
 * black blue yellow
 */

/**
 * int color = 1;
 * output
 * red
 */
```

匹配后如果不break，后面的代码都会执行，且不再匹配case。

## 循环控制

### do-while语句

```c
int arr_len = 2, i = 0;
do {
    printf("%d \n", i);
    i++;
} while(i < arr_len);
```

相比于while，do-while至少会执行一次循环体。

### while语句

```c
int arr_len = 2, i = 0;
while (i < arr_len) {
    printf("%d \n", i);
    i++;
}
```

### for语句

```c
int arr_len = 2;
for (int i = 0; i < arr_len; i++) {
    printf("%d \n", i);
}
```

## 跳转语句

### return语句

```c
int main (void) {
    return 0;
}
```

### goto语句

```c
int main (void) {
    int n = 0;
    printf("input a string ：\n");
loop:
    if (getchar() != '\n') {
        n++;
        goto loop;
    }
    printf("%d", n);
}
```

### continue语句

```c
while (x < 1000) {
    if (x&1 == 0) {
        continue;
    } else {
        printf("%d ", x);
    }
    x++;
}
```

### break语句

见switch语句