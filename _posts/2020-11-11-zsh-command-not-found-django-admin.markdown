---
layout: post
title: "zsh: command not found: django-admin.py"
data: 2020-11-11 15:28:10 +0800
tags: error
categories: programming
---

### Forward error solution:

	python -m django --version


	1.11.4


说明django安装成功，但是django-admin 报错 ‘zsh: command not found: django-admin.py’


解决办法：用ln -s 软链接 将django-admin命令 指向/usr/local/bin


sudo ln -s /Library/Frameworks/Python.framework/Versions/3.6/bin/django-admin /usr/local/bin/django-admin

