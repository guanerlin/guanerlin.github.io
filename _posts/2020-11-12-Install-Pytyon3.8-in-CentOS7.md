---

layout: post
title: "Install Python3.8 in CentOS7"
data: 2020-11-11 15:28:10 +0800
tags: errors
---



### These two days I want to deploy my django project on a server CentOS

what a disarster I came into.

Totally a mess

It just likes walking into a jungle and jumping out  a lot of ```Monsters```

What I suffered is in the list below:

1. when I run `python3 manage.py projectname`

   ```raise ImproperlyConfigured('SQLite 3.8.3 or later is required (found %s).' % Database.sqlite_version)```

   The sqlite3 version installed in the CentOS server is 3.7.17

   ```
   1.python3 进入python
   2.import sqlite3
   3.sqlite3.sqlite_version
   ->>>3.7.17
   ```

   [This solution form Stackoverflow](https://stackoverflow.com/questions/55674176/django-cant-find-new-sqlite-version-sqlite-3-8-3-or-later-is-required-found)

   I do the following commands to update my sqlite3 to 3.24.0

   ```
   wget https://www.sqlite.org/2019/sqlite-autoconf-3280000.tar.gz
   tar zxvf sqlite-autoconf-3280000.tar.gz
   ./configure
   make
   sudo make install
   
   export LD_LIBRARY_PATH=/usr/local/lib
   ```

   **But**

   Still run with this error

   ```django.db.utils.NotSupportedError: deterministic=True requires SQLite 3.8.3 or higher
   django.db.utils.NotSupportedError: deterministic=True requires SQLite 3.8.3 or higher
   ```

   E_E

   There are two solutions after hours of googling:

   1.recompile my Python3.8 

   I tried many times...many ways...

   Failed

   2.use pysqlite3 instead of sqlite3 according to this  (https://www.jianshu.com/p/e81d59ccb80d)

   Worked :)

   ```python
   pip3 install pysqlite3
   
   pip3 install pysqlite3-binary
   
   vi /usr/local/python3/lib/your-python/site-packages/django/db/backends/sqlite3/base.py
   
   commont this line: from sqlite3 import dbapi2 as Database
     
   add this line: from pysqlite3 import dbapi2 as Database
   ```

2. I dig a big hole for myself @2020-11-11

   At first I thought If I upgrade my Python3 from Python3.7 to Python3.8 will solve the sqlite version limit issue.

   I downloaded the python3.8.5 file from (https://www.python.org/ftp/python/)

   I unzip the tar and compile the Python source code and install and install and install...

   I came across some other issues on Installing Python3.8.5 in CentOS7...

   One solution you thought  causes more issues. What a damn shit...

   OK, what I drop in is the error:

   ```javascript
   ImportError: No module named _ssl
   ```

   I sovled it by 

   ```
   yum install openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel gcc gcc-c++  openssl-devel
   ```

   And then :

   uncomment below lines in Setup

   ```
   _socket socketmodule.c timemodule.c
   
   # Socket module helper for SSL support; you must comment out the other
   # socket line above, and possibly edit the SSL variable:
   SSL=/usr/local/ssl
   _ssl _ssl.c \
   -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
   -L$(SSL)/lib -lssl -lcrypto
   ```

   I found many toturials telling you how to install python3.8

   They mostly install it in Windows or MacOS.

   Even in Linux, it is a totally different case if the system version is different.

   So finally, I came into `generate-posix-vars failed` caused by the  enable-optimizations param when run .configure 

   Finally solved it by:
   
   Go in the Python source directory
   
   ```./configure
./configure
   make clean
   make && make install
   ```
   
   After intalled Python3.8, I return to solve the sqlite version 3.8.5 limit error by using pysqlite...
   
   This is life, so stop cring and just keep codign :)