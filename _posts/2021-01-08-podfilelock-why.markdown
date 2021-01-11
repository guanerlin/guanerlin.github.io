---
layout: post
title: "Podfile.lock-pod install newer version other than the versions in it"
date: 2021-01-08 20:52:00
tags: error iOS
categories: programming
---

今儿打包免费书项目1.2.0版本。失败。
之前在jenkins上打包并输出包体积报告成功过。但是今儿打包，就出现问题了。原因是pod install后，使用了近期更新的子pod，代码编译不过。(当然不过，需要更改业务相关代码才行)。
但问题是，下载旧版本tag，按理说应该根据Podfile.lock安装当时打tag时使用的响应pod库版本。


项目依赖子库A，A字库依赖B，B子库最近更新，依赖了项目C，D的新封装库C1，C2
项目C，D在免费书项目1.2.0版本是直接引用在项目里的。
结果pod install后，会安装C,D,C1,C2
C1,C2只是我封装加了个壳子封装的的C,D源码，去掉了他们内部存在，但业务项目不想再支持的UIWebView代码。没有报duplicate，只是报文件引用不到，cannot find .h。

查了一通，吧嗒吧嗒。

结果是：
podfile.lock并非当时发版时，
我们打tag时，podfile.lock是滞后的。造成这个原因是我们每次打包成功后不会回传当时在jenkins上构建包成功后的podfile.lock
我从tag拉下来的podfile A库版本是1.2.7
然后podfile.lock中是1.2.7-dev.4 这是我们开发版本，如果要发版了打正式版本tag，会把dev尾缀去掉。

那么就说的通了。
我们打测试版本时，使用dev的tag。在最后一次更改pod版本后为1.2.7，直接提交了podfile文件，没有在本地打一遍podfile.lock就commit代码了。在打包机jenkins上构建成功后，podfile.lock没有提交到代码库。打版本tag时，podfile和podfile.lock就出现了版本号不一致。
当podfile版本号不同于podifile.lock时，pod install就会尝试重新整理安装子库，此时A依赖的子库版本号使用方式是>=的，所以就更新成最新的了

### 那么之前免费书项目1.2.0为什么能打包成功呢？
呵呵，一个多月以前，我遇到这个问题，应该是发现是Podfile相关，在拉完代码后，替换掉了Podfile，防止不一致引发更新高版本子库。Jenkins的Build shell里还注释了相关代码。我这脑子，真可爱。
不过这次让我对cocoapods又加深印象，划算！
干了这杯自干五



