---
layout: post
date: 2020-11-26 16:37:00 +0800
tags: iOS Cocoapods
categories: programming
title: "xcodebuild某tag版本失败，由于Podfile中pod文件编译失败导致"
---

### 多么痛的领悟

相关技能点：
- compilation 
- pods version control in Cocoapods


#### Context:

   最近在做包体积优化，涉及到将代码编译打包输出App Size Thinning Report.txt.这个部分有空可以再写一篇。
目前的流程是，在Jenkins上配置了Job自动打包，根据选择的项目代码库，打包某个App的某个branch活tag版本，输出report。将数据上传到公司内部的一个VPS上的Django项目上，我浅显学了一阵子Python和Django，接触了Bootstrap4搭起来的一个backend service.我给他命名Jungle。


那么现在流程上是Jenkins负责打包项目，输出Size report,上传到Jungle中，在Jungle中提供数据的解析和数据显示层，比如可以选择项目，项目版本，项目某个版本在某个variant上的包大小(install size or download size)


#### Problem:
我打包了今个近期版本tag，Success.
打包了一个旧版本的，大概是几个月前的tag， Failed，失败原因是编译错误
错误信息：

`error: receiver 'XXWebView' for class message is a forward declaration`	
意识是前置声明遇到问题，解析不到该类的声明
XXWebView使我们一个封装的工具类pod库中的类

我在本地拉下tag，尝试编译打包，都是可以的。于是开始怀疑人生了。在我本地，看代码是没有问题的，所谓的这个编译错误看起来就不该发生。


#### Reason:
Jenkins部署的打包机是同事的iMac上（没错，不能用Virtual Private Server），在我本地是没问题可以编译可export。憋了两天，终于问了同组大哥-龙哥，一针见血，让我看看报问题的pod库，是不是在我电脑上和打包机上的版本其实不一样呢，看下Podfile.lock吧，我一看。。。我擦，果然我的版本是更低的0.3.8，打包机直接是最新版本0.4.3，所以出现了依赖低版本pod的项目代码因为引用了高版本并不向前兼容的pod导致了编译失败，shit，问题倒不深，但是我一直都没怀疑过是因为pod不同，是我对pod的版本控制这块的理解太肤浅，只是使用层面。

Podfile.lock是放到git里做了版本控制的，那之所以pod版本不同，是因为打包机上的shell脚本，配置了删除Podfile.lock，这么做是为了解决？？？（我稍后来填坑)


#### Solution:

- 1.调整shell，把删除Podfile.lock删了，就可以每次pod install的是打tag是的pod版本，Podfile.lock的存在就是为了这个吧。
- 2.以后pod库升级，尽量做到向前兼容，不要轻易删除，或者升级版本号时，考虑到依赖代码，要升级高位版本号，这个要复习下版本号规则
