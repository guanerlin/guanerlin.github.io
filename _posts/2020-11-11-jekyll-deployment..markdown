---
layout: post
title: "jekyll deployment"
data: 2020-11-11 17:07:10 +0800
tags: jekyll
categories: programming
---

- 1.config ruby

  [reference 'The definitive guide to installing Ruby gems on a Mac'](https://www.moncefbelyamani.com/the-definitive-guide-to-installing-ruby-gems-on-a-mac/)

  `brew install ruby`

  `echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc`

- 2.install bundle gem

  `gem install bundle`

- 3.install jekyll gem

  `gem install bundle jekyll`

- 4.bundle install missing gems

  `bundle install`

- 5.run local jekyll sever
  `bundle exec jekyll serve`