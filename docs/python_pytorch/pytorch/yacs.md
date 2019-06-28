写神经网络的代码时, 为了训练的方便, 我们经常将相关的配置信息写在一个配置文件中, 训练时指定配置文件即可, 而不需要传入过多的命令行参数. 设计好了配置文件, 就相当于有了建筑的蓝图, 剩下的真的只是搭积木了.

本文介绍利用 yacs 模块高效编写配置文件的方法.





## yacs

yacs 顾名思义就是 yet another configure system, 是一个配置系统. yacs 将一个网络的配置信息封装成一个树形结构, 具体的每一项就是树中的一个叶子节点. 下面是一个 demo.

```
from yacs.config import CfgNode as CN

_C = CN()

_C.MODEL = CN()
_C.MODEL.DEVICE = "cuda"
_C.MODEL.WEIGHT = ""

_C.INPUT = CN()
_C.INPUT.MIN_SIZE_TRAIN = (800,)  # (800,)
_C.INPUT.PIXEL_MEAN = [102.9801, 115.9465, 122.7717]
```

## 使用方法

实际使用中, 通常会有一个默认的配置, 我们可以像上面的 deme 一样, 将该配置写在 defaults.py 中, 但是我们在训练和测试时, 会不断改变配置, 只需要通过如下两种方法提供不同于默认配置的配置信息

- 将配置写在单独的.yaml文件中
- 通过命令行参数传入

不管采用哪种方法, 我们都需要利用新的配置去覆盖默认配置, 幸运的是 yacs 提供了两个对应的函数

- merge_from_file
- merge_from_list

