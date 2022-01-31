---
layout: wiki
tags: [git,工作流,github]
---

## 常见Git工作流

* Git flow
* Github flow
* Gitlab flow
* AoneFlow
* TrunkBased


## Git flow

最早提出于[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)，主要就是太复杂。

## Github flow

> 第一步：根据需求，从master拉出新分支，不区分功能分支或补丁分支。
>
> 第二步：新分支开发完成后，或者需要讨论的时候，就向master发起一个pull request（简称PR）。
>
> 第三步：Pull Request既是一个通知，让别人注意到你的请求，又是一种对话机制，大家一起评审和讨论你的代码。对话过程中，你还可以不断提交代码。
>
> 第四步：你的Pull Request被接受，合并进master，重新部署后，原来你拉出来的那个分支就被删除。（先部署再合并也可。）



第四步有两种做法，一是先合并master再发布，二是发布后再合并主干。推荐后一种方式，因为当某个特性需要中断发布的时候，先发布在合并只需要中断即可，无需回滚任何分支。

优势很明显，简单并行高效，对于以web服务为主的公司，强力推荐。但对于同时有多个版本发布的软件开发，这种工作流就不合适了。

## AoneFlow

阿里的git工作流


## 参考链接

* [Issues with git-flow](http://scottchacon.com/2011/08/31/github-flow.html)
* [Git工作流程](http://www.ruanyifeng.com/blog/2015/12/git-workflow.html)
* [Git在团队中的最佳实践--如何正确使用Git Flow](http://www.cnblogs.com/cnblogsfans/p/5075073.html)
* [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
* [在阿里，我们如何管理代码分支？](https://yq.aliyun.com/articles/573549)
* [代码分支管理指南](https://open.leancloud.cn/git-branch-guide/)
* [Git分支管理策略](https://www.ruanyifeng.com/blog/2012/07/git.html)