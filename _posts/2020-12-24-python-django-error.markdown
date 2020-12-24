---
layout: post
title: " __init__ raise TypeError("%s() got an unexpected keyword argument '%s'" % (cls.__name__, kwarg))"
tags: Django error
categories: programming
date: 2020-12-24 18:30:00 +0800
---

### 又是在Django中摸爬滚打的一天
果然对python不熟悉，加上马马虎虎就是容易浪费很多时间

#### 遇到主要的几个问题：
1. 这个是在Django中，我创建一个Model时，报错
报错：

```
 __init__ raise TypeError("%s() got an unexpected keyword argument '%s'" % (cls.__name__, kwarg))
 TypeError: Record() got an unexpected keyword argument 'install_size'
```

代码：
```
record_object = Record(app=app, version=report_object.version, report=report_object, device=data[0], os=data[1], download_size=float(data[2]), install_size=float(data[3]))
```

原因：
很狗血，我在定义model是，download_size字段我给的是model.FloatField，正确的应该是model.FloatField。这样的错误导致Django做migration的时候，没有给这个table创建这个字段成功。




2.读取文件失败，文本内容为b''

这是由于文件对象一旦read()以后，是有游标走动的。读完一个文件，既游标会走到最后的位置。再次调用read()就只能读出来空了。
解决办法：
file.seek(0)让游标回到最初位置，即可读出文本。

这个是基础问题，太基础了。诶
