---
layout: wiki
tags: [转码,音频]
---


```shell
# 将mp3转换成16000采样率的pcm
ffmpeg -y  -i test.mp3  -acodec pcm_s16le -f s16le -ac 1 -ar 16000 16k.pcm
```