cv 的代码中, 一般用 cv2 中的 imread 来读取图像, 这中间有很多坑, 比如: 读进来的是 H . W . C 还是 C. H. W, 这里做个记录.

cv2.imread 读进来的是 H . W . C, 还pytorch 用的时候一般是 C. H. W .

cv2.imread 读进来的是 B G R, 而不是 RGB