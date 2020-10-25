---
title: python regex examples
date: 2018-12-14 09:15:03
categories: python
tags: [python, regex, 正则表达式]

---

最近读 王伟的 <<伟哥的 python 私房菜>>, 读到一个字符串操作的例子, 觉得用正则表达式可以效率更高. 

<!--more-->

问题是这样的: mac(media access control) 地址是 48 个二进制位, 用 16 进制写是 12 位, 为了阅读方便, 需要将形如 50E549E32ECB 的 mac 地址, 每两位中间加上一个 ':'. 

<<伟哥的 python 私房菜>> 讲到两种实现.

```python
def modify_1(mac):
    a = mac.strip()
    b =''
    for i in range(len(a)):
        if i%2==0 and i!=0:
            b = b+':'+a[i]
        else:
            b = b + a[i]
    return b

def modify_2(mac):
    a = mac.strip()
    m = re.compile(r'.{2}')
    l = m.findall(a)
    return ':'.join(l)
```





利用正则表达式的环视功能, 可以有种更好的写法:

```python  
def modify_3(mac):
    m = re.compile(r'(?<=.)(?=(.{2,2})+$)')
    return m.sub(':',mac.strip())
```



我原以为第三种方法会更快, 经过测试, 第二种方法最快, 第三种只比第一种稍快一点. 

完整测试代码

```python 
import re
import random 
import time

mac1 = '50E549E32ECB'
def modify_1(mac):
    a = mac.strip()
    b =''
    for i in range(len(a)):
        if i%2==0 and i!=0:
            b = b+':'+a[i]
        else:
            b = b + a[i]
    return b

m2 = re.compile(r'.{2}')
def modify_2(mac):
    a = mac.strip()
    l = m2.findall(a)
    return ':'.join(l)


m3 = re.compile(r'(?<=.)(?=(.{2,2})+$)')
def modify_3(mac):
    return m3.sub(':',mac.strip())
    
def gene_data(n,filename):
    file = open(filename, 'w')
    for _ in range(n):
        s = ''
        for _ in range(36):
            i = random.randint(0,15)
            if i<10:
                s += str(i)
            else:
                s += chr(55+i)
        print(s,file=file) 

def test(fun, lines):
    if fun == 0:
        for line in lines:
            modify_1(line)
    elif fun == 1:
        for line in lines:
            modify_2(line)
    else:
        for line in lines:
            modify_3(line)

def main():
    gene_data(10000,'data.txt')
    file = open('data.txt','r')
    lines = file.readlines()
    for i in range(3):
        t0 = time.clock()
        test(i, lines)
        print(time.clock()-t0, 's')


if __name__ == '__main__':
    main()
```



<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

