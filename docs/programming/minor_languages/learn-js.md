---
title: learn_js
date: 2018-11-20 10:46:05
categories:
tags:

---

[教程](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000)

适当了解, 方便日后查阅. 

<!-- more -->

# notes

JavaScript引擎自动提升了变量`y`的声明，但不会提升变量`y`的赋值。

在函数内部定义变量时，请严格遵守“在函数内部首先申明所有变量”这一规则。最常见的做法是用一个`var`申明函数内部用到的所有变量：

```javascript
function foo() {
    var
        x = 1, // x初始化为1
        y = x + 1, // y初始化为2
        z, i; // z和i为undefined
    // 其他语句:
    for (i=0; i<100; i++) {
        ...
    }
}
    
    
```

不在任何函数内定义的变量就具有全局作用域,JavaScript默认有一个全局对象`window`



减少冲突的一个方法是把自己的所有变量和函数全部绑定到一个全局变量中。例如：

```
// 唯一的全局变量MYAPP:
var MYAPP = {};

// 其他变量:
MYAPP.name = 'myapp';
MYAPP.version = 1.0;

// 其他函数:
MYAPP.foo = function () {
    return 'foo';
};
```

把自己的代码全部放入唯一的名字空间`MYAPP`中，会大大减少全局变量冲突的可能。



解构赋值

```javascript
var [x, y, z] = ['hello', 'JavaScript', 'ES6'];

```























<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>



