tex 用写毕业论文时, 为了画图, 用了 subcaption 这个包, 然后本来正常的latex 代码, \ref 前面的算法时, 总是显示不出来, 一番查找才发现是 `\label `和 `\caption` 的顺序搞反了.

因为是增加了 subcaption 这个包之后才报的错, 所以我刚开始以为是包冲突了. 后来我很奇怪, 为什么一个插图的包, 会叫 subcaption 这个名字, 才猜测是不是因为 caption 的原因, 一搜果然是这样. 踩过方知, 方知有多坑.

记住, `\caption` 和 `\label` 都要写在相应的环境中, 而且 `caption` 必须在 `label` 前, 否则有可能会出错.