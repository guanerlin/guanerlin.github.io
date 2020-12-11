---
layout: post
title:  "Compiled Language VS. Interpreted Language"
date:   2020-11-26 11:00:35 +0800
tags: language 
categories: programming
---

Programming languages break into two different families:complited and interpreted. A compiled languages is coded by a human, then that source code translates into assmbly language so that the target program runs and returns a desire result. An interpreted languages, however, is compiled in real time when it's run, and it often uses simpler and more human-friendly syntax for coding.

<br>

### What is a Compiled Language?
Consider a simple program, helloworld.c, written in the C programming language:
```
#include<stdio.h>
int main()
{
	printf("Hello World");
}
```

<br>

C is a example of a compiled language. To run the above code, you must pass it through a C compiler- a program that interprete your code to construct a binary program. To compile a C program in Linux, use the gcc compiler:


```
gcc helloworld.c -o hello
```
<br>

The above command turns the code from human-readable format into machine code that the computer can run natively. A compiled programe runs by excuting the name of the compiled program from the shell:
```
./hello
```
<br>


`STRENGTHS AND WEAKNESSES`

The benefits of using a compilter to compile code is that the final product generally runs faster then the interpreted code because it doesn't need to compile on the fly whie the application is running.

The compiled programm was checked for errors during compilation. If there are any commands that compiler doesn't like, then they will be reported. This error-checking helps you fix all the coding errors you've got a well running final product.

However a C program compiled on a Linux computer will not run on a Windows computer, because the compilter includes the necessary tools to run the application on a specific platform-usually, the platform upon which it was compiled. To ge the same C program to run on a Windows computer, you must compile the program again using a C compilter on a Windows computer.

```
gcc compilter program also support theWindows platform
Four steps in gcc process
- Preprocess
- Compilation
- Accemblly
- Linking
```

### What is an Interpreted Languages?

Python is a popular interpreted language.

```
print("hello world")
```

The above code is a python program that will display the words `hello world` when it is run. To run the code we do not need to compile it first. Instead, we can simply run the following command:
```
python helloworld.py
```

Alternatively, just type it from the Python interactive interpreter.
This tiny one-line program does not need to be compiled first but it does require that Python is installed on any machine that runs the script. The Python interpreter takes the human-readable code and turns it into something else before making it something the machine can read. All of the happens behind the scenes and as a user, all you see are the words `hello world` printed to standard ouput.

`STRENGHTS AND WEAKNESSES`

In general, interpreted code runs more slowly than compiled code becuause the interpreter translates the program-on-the-fly into somthing the machine can handle.

Although this efficiency hit might seem like a downside, interpretred languages are useful for several reasons. First, it is much easier to get a grogram written in Python to run on Linus, Windows, and macOS. All you need to do is make sure Python is installed on the computer you wish to run the script.

Another benefit is that the code is always available for reading and it can be easily changed to work the way you want it to. With compiled code, you need to find where the code is kept, change it, compile it, and redeploy the program. With interpreted code, however you open the program, change it, and it is ready to go.

```
macOS is not based on Linux;
Both kernels  have very different histories and features.
macOS is based on a combination of two even older code base(Mach kernel and BSD code)
Linux was created by Linus Torvalds in 1911.
```





