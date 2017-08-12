---
title: jekyll主题模块化
layout: post
tag: [jekyll,liquid,dns,github]
---

从2013年开始，我的博客主题就没变过，这期间虽然加了很多功能，但视觉上没有什么本质的变化，审美疲劳后，多少有点想换主题的冲动，顺便也练练前端。不过回过头看以前的代码，发现整个布局结构和post的head耦合性很高，所以如果只是简单的替换布局文件，基本上跑不出理想的效果，因此考虑把整个布局结构和post内容完全隔离出来，顺便可以将现有主题开放一个新项目，直接供别人使用。以下是实践中的一些心得

## submodule

post和布局隔离后，整个目录只包含post文件夹、_config.yml和theme文件夹，theme文件夹下面的主题作为submodule引入，而_config.yml则负责控制主题的选择以及其它可变量的配置。

## jekyll

jekyll相关的问题主要是theme目录下的index文件在build后无法存储在根目录，导致主页访问404，最开始尝试使用扩展Jekyll-redirect-from，但是死活访问不通，考虑到github因为安全的问题本来就不太想支持插件，仅有的几个插件也常常报问题，遂放弃了插件这条路。接着仔细查看官方文档，发现permalink就能很好的解决问题，果然官方文档是解决所有可解决问题的最终途径。

## liquid

liquid是jekyll支持的默认模板语言，虽然标签不少，但毕竟是模板语言，要实现一些复杂逻辑的时候，思路会比较绕，所以一方面是尽量简化逻辑，二是尽量把数据传给js，让js去处理。

## dns

这个和模块化关系不大，但中间遇到了些问题顺带就记录在这。我的网站放在github page上，而且是多个项目，一个指向一级域名，其它指向二级域名，配置的时候在每个项目的CNAME文件下写入指向的域名，同时dns配置使用CNAME指向your-github-name.github.io即可。不过有几个问题，一是我同时用了一级和二级域名，所以没办法直接使用your-github-name.github.io/project-name的方式进入一级域名网页，二是github不支持使用多个一级域名，当然这不算什么大问题。最后，吐槽下老薛的dns配置，我开始直接用A记录指向github-IP服务器，一直试图修改CNAME不成功，后来发现是他们的bug，只能先删除A记录然后再添加对应CNAME记录。。。

除了blog隔离了post和theme外，我把github上展示书籍的项目也做了隔离，抽象了一个可用于展示通用品类的主题，依旧采用submodule引入，所有的展示项目都使用纯head的markdown存储，可自定义标签。而需要展示的标签项则通过_config.yml配置即可。

附上两个主题和两个使用主题的项目地址

* [博客主题](https://github.com/AImager/freshness)
* [展示主题](https://github.com/AImager/exhibit)
* [博客项目](https://github.com/AImager/blog)
* [书籍项目](https://github.com/AImager/bookcase)


## 参考链接

* [Troubleshooting custom domains](https://help.github.com/articles/troubleshooting-custom-domains/)

