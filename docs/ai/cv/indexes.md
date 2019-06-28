本文介绍机器学习中的 5 个指标, 分别是 recall, precision, F值, average precision, mean average precision.





首先了解下

| TP   | True Positive  | 将正类正确分类为正类 |
| ---- | -------------- | -------------------- |
| FP   | False Positive | 将负类错误分类为正类 |
| TN   | True Negative  | 将负类正确分类为负类 |
| FN   | False Negative | 将正类错误分类为负类 |

True, False 是说分类正确与否, Positive, Negative 是说分类的结果, 而不是真实的类别.

## Precision

关于精度, 一个直观的想法是分类正确的样本数占所有样本的比率. 不过这是 accuracy
$$
accuracy = \frac{TP+TN}{TP+TN+FP+FN}
$$
在很多问题中, 我们关心的是正类, 所以
$$
precision = \frac{TP}{TP+FP}
$$

也就是判别为正类的样本中, 有多少是正确分类的.

## Recall

和精度不同, 召回率是真实的正类中, 有多少是你检测出来了.
$$
recall = \frac{TP}{TP+FN}
$$

## F值

F值综合考虑了 precision 和 recall
$$
F = \frac{2*P*R}{P+R}
$$

## Average precision

如果仅仅只用 precision, 和 recall, 往往不能很好地反映算法效果, 所以提出了average precision, 所谓的 average, 就得搞清楚是关于什么进行 average?

进行 average 时, 是这样考虑的, 将 confidence score, 按降序排序, 然后, 以从前到后累积的方式, 计算出一系列的 recall 和 precision, 注意, 此时 recall 是非降的, 但 precision 不一定, 所以将 recall 和 precision 画在图中可以得到 PR 曲线, 然后对 precison 向右一位取较大值, 即可得到一个非升曲线, 计算曲线下方的面积就是 average precison 了.

## mAP

目标检测等任务中, 通常有多类目标, 算出各类别的 average precision 后, 取平均就是 mAP.

更为详细的说明参见 [这篇博客](https://medium.com/@jonathan_hui/map-mean-average-precision-for-object-detection-45c121a31173)