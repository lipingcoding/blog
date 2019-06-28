本文系统总结下 python 的模块(module), 包(package)的相关知识.



### 先明确定义:

1. Module/ 模块, 就是一个包含了定义和声明的 .py 文件, 本身也可以做为脚本运行.
2. package/包, 就是将若干 moudle 和package 组合起来, 特点是目录里必须有一个 ‘__init__.py’ 文件.

### 模块使用

python 交互式命令行或者程序本身就是一个特殊的 module, 叫做 main module. import 模块名(不包括.py) 相当于把该模块中定义的内容导入到 main 中, 实现代码复用的目的.

```
# 假如有一个 moudel 文件: mymodule.py
import mymodule
from mymodule import fun1, fun2, var1
from mymodule import * # 一次性导入所有, 除了以下划线开头的
```

##### 模块搜索路径

首先在按照 sys.path 进行搜索, sys.path 由如下三部分组成, 不保证先后顺序.

- 当前目录
- 系统变量 PYTHONPATH
- python 安装过程有关

可以更改

```
sys.path.append('/ufs/guido/lib/python')
```

### 创建模块

模块的创建方式与普通脚本的写法没有区别. 在模块脚本内部, 模块名可以通过 ‘__name__‘ 被访问.

### 自定义包

算定义包相比写模块就多了init 文件’__init__.py’ . init 文件可以为空, 但必须要有.

对于包 A 来说, init 文件有如下功能:

- 定义 `__all__` , 指定 from A import * 到底会 import 什么

  如果没有定义的话, 只会 import init 文件中定义的或者导入的模块

- 定义一些 package-level 的变量,函数和类, 包 A 的使用者可以通过 形如A.moudle, A.var 等形式访问

- 将子包,子模块甚至是其它包中的内容导入到 package-level , 使得用户不必关心相关内容的真实定义位置.

### 包使用

与模块导入相比, package 的导入多了 Intra-package References. 也就是在一个包中的模块或者子包可以相互导入, 类似于相对路径.

设 package A 结构如下

```python 
A/
	__init__.py
	B.py
	C/
		__init__.py
		D.py
		E.py
from . import E  # written in D.py
from .C import D # written in B.py
import ..B 		 # written in D.py
```