本文是笔者在 python 编程过程中积累的提高程序鲁棒性的 tips.

1. 多用断言

   好处很多: 及早知道报错信息, 方便 debug.

   常用断言

   ```
   assert isintance(param, (A, B)) #param 是 A 或者 B 类型
   ```

2. python 版本兼容

   1. 对于 print, 在代码开头(必须)写上 `from __future__ import print_function` .

   2. Python 2, 2/3 = 0

      python3, 2/3 = 0.6

      想在 python2 中利用精确乘法的特性, 可以 `from __future__ import division`

   3. 其他与版本相关, 可以利用 `sys.version_info[0] == 2 or 3`, 进行条件判断.

3. is None 判断