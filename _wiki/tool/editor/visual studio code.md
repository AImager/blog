---
title: visual studio code
layout: wiki
category: tool
tags: [编辑器]
---


## 调试

下面是设置tasks.json，用于编译过程，我试过debug不设置tasks，直接用lanuch.json，总是立马退出。

```json
{
    "version": "2.0.0",
    "tasks": [{
        "label": "cpp_current",
        "args": ["-c", "g++ -g ${file} -o ${fileDirname}/${fileBasenameNoExtension}"],
        "group": "build",
        "type": "shell",
        "command": "bash",
        "presentation": {
            "reveal": "always"
        }
    }]
}
```

设置tasks后，设置lanuch.json，用于调试单个C++文件，其中preLanuchTask就是debug前先执行的task。

```json
{
    "version": "0.2.0",
    "configurations": [{
        "name": "cpp_current",
        "type": "lldb",
        "request": "launch",
        "program": "${fileDirname}/${fileBasenameNoExtension}",
        "cwd": "${workspaceRoot}",
        "osx": {
            "MIMode": "lldb"
        },
        "preLaunchTask": "cpp_current"
    }]
}
```

## Tips

* `shift + alt`然后使用鼠标下滑，可方便的使用多列编辑
* **多行正则匹配**在单个文件里面是支持的，但在目录下面搜索，只会搜索已打开的文件。


## 配置

* [Theme Color](https://code.visualstudio.com/api/references/theme-color)


## MAC快捷键

* ctrl -: 返回跳转前的位置