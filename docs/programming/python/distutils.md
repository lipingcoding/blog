最近在阅读 Facebook AI research 出品的 Maskrcnn-benchmark 的代码, 里面用到利用 setuptools 包使得自定义的模块就像安装在系统中的第三方模块一样, 不用考虑路径问题. 决定好好研究下, 但是发现 setuptools 说明文档不是很详细, 好在setuptools 是 distutils 的升级版, 了解下 distutils 是非常有必要的.



distutils 顾名思义就是 distribution utilities, 是为了方便模块的 distribution.

## 模块

首先我们理一下 python 的模块(module)的概念.

> module
>
> the basic unit of code reusability in Python: a block of code imported by some other code. Three types of modules concern us here: pure Python modules, extension modules, and packages.

模块分为三类

> pure Python module
>
> a module written in Python and contained in a single `.py` file (and possibly associated `.pyc` files). Sometimes referred to as a “pure module.”
>
> extension module
>
> a module written in the low-level language of the Python implementation: C/C++ for Python, Java for Jython. Typically contained in a single dynamically loadable pre-compiled file, e.g. a shared object (`.so`) file for Python extensions on Unix, a DLL (given the `.pyd` extension) for Python extensions on Windows, or a Java class file for Jython extensions. (Note that currently, the Distutils only handles C/C++ extensions for Python.)
>
> package
>
> a module that contains other modules; typically contained in a directory in the filesystem and distinguished from other directories by the presence of a file `__init__.py`.

## 安装第三方模块

接下来我们回顾

## 模块导入

## 模块分类

- 内置模块, 可用 sys.builtin_module_names 查看
- 标准库
- 外部库

```python 
import sys

sys.modules #当前已导入的所有模块
```

