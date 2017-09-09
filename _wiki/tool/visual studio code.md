---
title: visual studio code
layout: wiki
category: tool
tags: [编辑器]
---


## 调试

下面是设置tasks.json，用于编译过程，我试过debug不设置tasks，直接用lanuch.json，总是立马退出。

~~~JSON
{
    "version": "0.1.0",
    "command": "bash",
    "isShellCommand": true,
    "args": ["-c"],
    "tasks": [
        {
            "taskName": "cpp",
            "args": ["g++ -g ${file} -o ${fileDirname}/${fileBasenameNoExtension}"],
            "isBuildCommand": true,
            "suppressTaskName": true
        }
    ],
    "showOutput": "always"
}
~~~

设置tasks后，设置lanuch.json，用于调试单个C++文件，其中preLanuchTask就是debug前先执行的task。

~~~JSON
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cpp",
            "type": "lldb",
            "request": "launch",
            "program": "${fileDirname}/${fileBasenameNoExtension}",
            "cwd": "${workspaceRoot}",
            "osx": {
                "MIMode": "lldb"
            },
            "preLaunchTask": "cpp"
        }
    ]
}
~~~