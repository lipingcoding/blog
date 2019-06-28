最近在安装破解版 Cleanmymac 时, 竟然提示 ‘XXX is damaged’. 没升级到 OS 10.14 前, 一般都是提示 ‘不是来自受信赖的开发者’ 之类.



## 问题

去 System Preferences/ Security and Privacy 里发现, 现在没有了 From anywhere 这个选项了.

------

## 解决方法

在 Terminal 输入

```
sudo spctl --master-disable
```

然后 From anywhere 这个选项就又出现了

------

## 后记

Mac 现在给用户的自由越来越少了, 价格也越来越高, 相比之下, windows 现在给开发者的便利越来越多, 是不是该考虑换平台了.