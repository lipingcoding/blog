用 matplotlib 很久了, 但始终没有系统学习过, 总是觉得很不踏实. 遇到问题总是 baidu, 最终在 csdn 上找找答案. 这也是 python 日常应用很多人的一个 style, 大家也知道, 官方文档是最标准的答案, 为什么不去呢, 一是不想看英文, 二是官方文档很长, 一下子不容易找到想要的答案.

但是 matplotlib是一个hierachical 的库, 有一个整体的了解是有必要的. 今天做一个总结.



matplotlib分为多个 level

1. 由 matplotlib.pyplot 提供的状态机环境
2. 面向对像的接口

重要概念

1. Figure: 整张图片
2. Canvas: 画布, figure 里的东西都画在 canvas 上
3. Axes: 其实就是 subplot, 一个作图的子区域, 一张 fi
4. Axis: 坐标轴, 一个 Axes 可能有多个Axis, 从英语上看, Axes 也是 Axis 复数形式
5. Artist: 图片上能看到的都是 artist, 比如线, 点
6. Backend: 分为两大类, 交互式和非交互式.

matplotlib 只保证接受numpy中的 ndarray作为画图数据.