---
layout: post
date: 2020-12-18 10:54:00 +0800
tags: python regularExp
categories: programming
title: "Python re module findall"
---


[转载](https://www.cnblogs.com/springionic/p/11327187.html)


### findall 函数：

在字符串中找到正则表达式所匹配的所有子串，并返回一个列表，如果没有找到匹配的，则返回空列表。

注意： match 和 search 是匹配一次 findall 匹配所有，match 和 search 的区别也很大，可以自行网上查找！

 

这里主要需要讨论的是其返回值的展现方式，即findall函数根据正则表达式的不同所返回的结果包含的不同信息！

主要包含三种情况：

1. 当给出的正则表达式中带有多个括号时，列表的元素为多个字符串组成的`tuple`，tuple中字符串个数与括号对数相同，字符串内容与每个括号内的正则表达式相对应，并且排放顺序是按括号出现的顺序。

```
# 例子，正则表达式里分了两个组

import re

test = '2018年的下半年，9月份， 27日'
pattern = re.compile(r'(\d)+(年|月|日)')
res = pattern.findall(test)
print(res)

# 输出结果： [('8', '年'), ('9', '月'), ('7', '日')]
```

2. 当给出的正则表达式中带有一个括号时，列表的元素为字符串，此字符串的内容与括号中的正则表达式相对应（不是整个正则表达式的匹配内容）。

```
# 例子，正则表达式里有一个分组

import re

test = '2018年的下半年，9月份， 27日'
pattern = re.compile(r'\d+(年|月|日)')
res = pattern.findall(test)
print(res)

# 输出结果： ['年', '月', '日']

```

3. 当给出的正则表达式中不带括号时，列表的元素为字符串，此字符串为整个正则表达式匹配的内容。

```
# 例子，正则表达式里没有分组

import re

test = '2018年的下半年，9月份， 27日'
pattern = re.compile(r'\d{4}年|\d{1}月|\d{2}日')
res = pattern.findall(test)
print(res)

# 输出结果： ['2018年', '9月', '27日']
```

或者

```
# 例子，输出和3中同样的结果

import re

test = '2018年的下半年，9月份， 27日'
pattern = re.compile(r'\d{1,4}(?:年|月|日)')
res = pattern.findall(test)
print(res)

# 输出结果： ['2018年', '9月', '27日']
```

