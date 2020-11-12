---
layout: post
title: "Install Python3.8 in CentOS"
data: 2020-11-11 15:28:10 +0800
tags: errors
---



### These two days I want to deploy my django project on a server CentOS

what a disarstor I came into.

Totally a mess

It like walk into a jungle and come across a lot of ```Monsters```

What I suffered is in the list below:

1. when I run `python3 manage.py projectname`

   ```raise ImproperlyConfigured('SQLite 3.8.3 or later is required (found %s).' % Database.sqlite_version)```

   Stackoverflow:

   [This solution form Stackoverflow saved my ass](https://stackoverflow.com/questions/55674176/django-cant-find-new-sqlite-version-sqlite-3-8-3-or-later-is-required-found)

