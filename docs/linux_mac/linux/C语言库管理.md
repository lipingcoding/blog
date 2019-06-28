# C语言库管理

虽然现在的深度学习是 python 的天下, 但是在配置环境时, 有时候必须解决 cuda, opencv 的安装及配置问题, 这就涉及到 c/c++库的管理.

笔者之前使用 caffe 时, 使用的是师兄的祖传 Makefile, 现在虽然改用 pytorch, 但是跑开源代码时, 别人的 cuda, opencv 版本和服务器上的不一致, 这就需要自己配置. 之前不懂原理, 到处 google, baidu, 查看 github 的 issues, 苦不堪言. 最近就针对这些问题, 做个系列总结. 此乃第一篇, 介绍 c/c++ 的库管理.

## 编译与链接

本节主要参考 [这篇博客](http://www.firedragonpzy.com.cn/index.php/archives/2556)

我们知道, c/c++的代码要最终转化成可执行文件, 需要经过编译和链接两步. 只不过我们之前学习的时候, 写的代码比较简单, 通常一次性 `g++ main.cpp` 就把两步合并了.

所谓编译, 就是将源代码转成机器码的过程. 你可能会问, 既然是机器码, 那不就可以运行了吗? 那还不行, 因为编译的基本单元是一个 cpp 文件, 彼此独立, 而一个程序一般涉及到多个 cpp 文件. 所以你对多个文件进行编译时, 只会得到多个以 .o 结尾的目标文件.

比如

```
//文件结构如下
.
├── help.cpp
├── help.h
└── main.cpp
// main.cpp
#include<iostream>
#include "help.h"
using namespace std;
int main(){
        cout<<sum(1, 2)<<endl;
}
//help.h
int sum(int, int);
//help.cpp
int sum(int x, int y){
    return x + y
}
```

那么编译链接的过程如下

```
g++ -c main.cpp` 编译得到目标文件 `main.o
g++ -c help.cpp` 编译得到目标 `help.o
g++ main.o help.o` 链接得到可执行文件 `a.out
```

现在我们可以思考下头文件的意义了. 头文件一般是提供变量或者函数的声明, 这样 当 cpp文件在编译时, 发现找不该 cpp文件本身找不到函数或者变量的定义时, 就会 include 的头文件中寻找. 你可能会想, 那为什么不直接 include cpp文件呢, 很简单, 因为编译时, 不同的 cpp文件是独立的. 那为什么不把函数和变量的定义写在 cpp文件中呢, 因为当文件较多时, 由于嵌套 include, 可能会造成重复定义.

## 细究 include

注意到上节的代码中, `main.cpp` 中在 include iostream 和 help.h 时的写法稍有不同, 前者是 `include < >` 后者是 `include " "`. g++ 在编译的时候会有一个 search path, 前者就是在 search path 中寻找, 而后面 `include " "` 其实是指明了路径, 比如 `include "help.h"` 其实是 `include "./help.h"` , g++ 如果找不到, 就会再去默认的 search path 中去寻找.

c++ 的 search path 可以通过在命令行运行 `cpp -v` 查看.

编译时也可以在命令行中利用 `-I`选项 临时增加 search path.