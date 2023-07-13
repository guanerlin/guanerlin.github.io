---
layout: post
title:  "Protocols in Swift"
date:   2023-07-13 14:49:35 +0800
tags: iOS Swift
categories: Programming
---

## Protocol

#### 1. One of the most powerful uses of protocols is to facilitate code sharing.

- 1.1 Implementation can be added to a protocol by creating an extension to it!!!

- 1.2 Adding extensions to protocols is key to protocol-oriented programming in Swift.

#### 2. Equatable Protocol
So what is in the Equatable Protocol?
It's pretty cool... Things that "behave like" Equatable can be compare with ==.

Swift knows to call the static function in the Equatable protocol when you do == ...

```
protocol Equatable {
  statuc func ==(lhs: Swlf, rhs: Self) -> Bool
}
```

Yes, it's legal for a func name in Swift to be ==(🫑 is also a legal Swift func name!)

The type Self above means "the actual type that is implementing Equatable".
When you implement Equatable in a struct, you replace Self with your struct's type.

### The kind of Self-referencing protocol cannot be used as a normal type.

In other words, var x: [Equatable] makes no sense whatsoever.
There'd be no way to equate two completely different kinds of structs.

Since their == function above wouldn't be able to take the two different types as arguments.

This is also why we can never do var myView: View(View is Self-referencing as well).


## Generics and Protocols
