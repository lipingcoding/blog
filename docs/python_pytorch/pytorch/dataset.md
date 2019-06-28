与数据相关的主要有三个部分:

1. 定义 Dataset
2. 实现相关的 Transform, 传给 Dataset
3. 实现迭代器 Dataloader





## 定义 Dataset 类型

Dataset 类型应当继承 torch.utils.data.Dataset, 重载 ‘__len__‘ 和 ‘__getitem__‘ 函数.

```
#对于图像数据来说, numpy 和 torch 有区别
# numpy image: H x W x C
# torch image: C X H X W
```

## Transform

一般将 Transform 写成 callable class, 避免每次调用时都要传参数.

torchvision.transforms 中定义了很多变换,

## 迭代器

需要继承torch.utils.data.DataLoader , 迭代器相比简单的 for 循环, 主要可以实现如下功能

1. batch
2. suffle
3. 多线程