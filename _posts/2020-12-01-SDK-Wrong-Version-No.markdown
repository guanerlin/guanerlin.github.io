---
layout: post
title: "Wrong Version Number of 3rd party SDK"	
date: 2020-12-01 23:10:00 +0800
tag: error iOS
categories: programming
---

今天，更新SFKS的SDK，本来就知道他们不是很靠谱。果然，又出了状况。

他们最新SDK版本是4.3.4.1， 从该司github private project页面下载SDK.framework，覆盖到项目中，一般替换完第三方SDK，我都会检查下版本号是否已改变，验证更新的正确性。
好家伙，版本号居然是4.3.0.0 问题是我们之前的版本是4.3.2.0，怎么升级了SDK，反而版本号变小了。。。我去QQ群里找他们开发反馈；


对方开发的意思是，我是不是下载错了，他下载是验证是没问题的。我觉得操作过程没问题，看到他们也支持Cocoapods集成，就去他们Spec里查找版本，接入其他版本尝试，

- 使用某个联系项目pod引用他们最新版本
- pod install后提取他们的framework
- 手动替换到主项目中验证接入后的版本号

结果，版本号是可以对应正确的。

期间，他说过新版的包会小不少，果然这个最新版相较上个版本小了很多，之前framework大小还是80多MB，现在最新的4.3.4.1只有36.5MB了；其实如果我早注意到这个可能会有助于我独立发现问题；

最后，对方开发让我试下demo，下载了emo，一字不改的运行，还是4.3.0.0。:(

他们开发让我发送demo给他试试，他那里就是4.3.4.1了，好神奇；
结果他问了我一句

`你是不是用的模拟器。。。`

`我说是的`

悲剧了 他说必须用真机，他们升级Xcode12后，不支持编译模拟器架构framework；

but我反手用
`lipo info xxx.framework/xxx`检查，他们是支持i386和x86_64的，233333


可能是他们没有pod设置？，总之，搞了几个小时，居然又载在了architecture上

最近看framework，architecture比较多，还是要继续熟悉下；我的开发机iPhoneSE就是最近无法签名导致无法debug，还在跟踪此事；

挖个坑吧，希望能填上。

今儿还遇到一个问题，
gitlab上创建新的repository， 在本地无法push master和develop个人分支，报无权限错误。后来逼得我没办法，在gitlab网页端处理，也即是在网页端新建README.md这种文件，然后等于有了master分支，再拉到本地；然后也可在网页创建develop分支，做开发，可拉到本地修改后提交推送
真的呢很神奇的一天:(

