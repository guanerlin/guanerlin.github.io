---

layout: post
title: "C Language Notion"
date: 2020-12-11 22:51:10 +0800
tags: language c
categories: programming
---

今天发现C语言忘光了。其实就是压根当年学的时候，没有太在意，后来工作中也没有认真思考和总结回顾过。
说来惭愧，写了这么久iOS程序，一直不能深入了解很多东西，原来都是因为我C语言这层就是个丈二的和尚。
趁着周末，赶紧补补吧。这个周末补补C基础，把[这个网站][(https://www.runoob.com/cprogramming/c-variables.html)] 的都走一遍基础理论知识。

### OKR

#### Objective
	复习C语言基础
	结合已有iOS项目，对应目前项目中已使用的C相关代码，扫盲阶段
	用C语言写一遍排序算法

#### Key Result
	用C语言写排序算法
	通过C语言，丰富对内存，编译，程序底层一些的基础知识
	读完一本C语言的书


#### Duration
	希望是本月个人碎片时间完成


<br>

----------------------------------------------------------------

<br>



### Day 1

1. **关于编译器**：
	
- `Clang`是C语言家族的编译器
	
2. **基础知识**
	- C 语言程序文件的后缀为` .c`
	- 在`.m`中写C语言和`.c`(c语言文件格式，.h objc和c是一样的作用)中是一样等效的

3. **基本变量类型**
	- `int` `char` `float` `double` `void`(void代表没有任何值)
	- extern关键字：在方法外定义的变量，是全局变量，在其他文件想引用，需要使用extern关键字声明
	- 全局变量内存被分配在全区存储区中，局部本地变量分配在栈stack上，只有函数在被调用时才被临时分配存储单元

		```
		语言经过编译之后将内存分为以下几个区域：
		1）栈（stack）：由编译器进行管理，自动分配和释放，存放函数调用过程中的各种参数、局部变量、返回值以及函数返回地址。操作方式类似数据结构中的栈。
		2）堆（heap）：用于程序动态申请分配和释放空间。C语言中的malloc和free，C++中的new和delete均是在堆中进行的。正常情况下，程序员申请的空间在使用结束后应该释放，若程序员没有释放空间，则程序结束时系统自动回收。注意：这里的“堆”并不是数据结构中的“堆”。
		3）全局（静态）存储区：分为DATA段和BSS段。DATA段（全局初始化区）存放初始化的全局变量和静态变量；BSS段（全局未初始化区）存放未初始化的全局变量和静态变量。程序运行结束时自动释放。其中BBS段在程序执行之前会被系统自动清0，所以未初始化的全局变量和静态变量在程序执行之前已经为0。
		4）文字常量区：存放常量字符串。程序结束后由系统释放。
		5）程序代码区：存放程序的二进制代码。
		```

	- `int`是4个字节，`char`是1个字节，`float`是8个字节，这个所使用的程序架构有关，比如32位还是64位的cpu archetecture
	- 在`.h`中写c方法声明，在`.c`中引用后即可使用，`include "xx.h"`
	- c99之前c语言没有布尔值
	- **sizeof**使用

		```
		#include <limits.h>
		//sizeof方法可以打印变量所占用字节数

		printf("sizeof char in X86_64 = %lu\n",sizeof(char));
		```

	- 变量地址分配，我的Macbook pro Intel `X86_64`先定义的地址值会更大，不赋值的变量默认值是0


		```
	int i,j,b;
	printf("i addr :%p, j addr:%p \n", &i, &j);
	/// output:
		i addr :0x7ffee715fbb4, j addr:0x7ffee715fbb0
		```
4. **常量**
	- 常量,不可修改
	- 字符串字面值或常量是括在双引号 "" 中的
	- 两种方式
		`define`预处理器 和 `const`关键字
		1. define identifier value
		2. const type variable = value，`const`定义的是变量，只不过这是个不可修改的变量
		3. 常量大写

5. **存储类**

  **auto, register, static, extern四个存储类型**
  1. auto：是局部变量方法内部默认的存储类型
  
  2. register：是寄存器存储类型，指让变量不要存到内存(RAM)中，可能存到寄存器里(受硬件限制)，用的地方比较少，一般是用于需要快速访问的变量比如计数器。不能它修饰的变量使用按位与&
    因为变量没有内存地址

  3. static:
  - static 存储类指示编译器在程序的生命周期内保持局部变量的存在。在方法内声明的static变量，作用域是方法内
  - static 修饰符也可以应用于全局变量。当 static 修饰全局变量时，会使变量的作用域限制在声明它的文件内。
  - static 修饰的全局变量和方法后，可以在该文件内被调用
  - 思考下`objc`中单例对象的实现

  4. extern:

  - extern 存储类用于提供一个全局变量的引用
  - 当您有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 extern 来得到已定义的变量或函数的引用。可以这么理解，extern 是用来在另一个文件中声明一个全局变量或函数。








  ```
  + (instancetype)sharedManager {
      static AFNetworkReachabilityManager *_sharedManager = nil;
      static dispatch_once_t onceToken;
      dispatch_once(&onceToken, ^{
          _sharedManager = [self manager];
      });
      return _sharedManager;
  }
  ```