---
layout: post
date: 2020-12-18 10:54:00 +0800
tags: tips software
categories: programming
title: "在MacOS，terminal中打开sublime软件"
---


### Open folder in Sublime app from terminal

[参考这个链接](https://jeffreyeverhart.com/2017/09/14/open-files-folder-sublime-text-terminal/)

是在.bash_profile里添加一行

```
alias sublime "/Applications/Sublime\ Text.app"
```

然后要source ~/.bash_profile才能好使。我重启terminal 就不好使了。只能再次source