---
title: Make shadowsocks work in Mac terminal through proxychains
date: 2018-11-07 09:25:08
categories: mac
tags: [shadowsocks, proxychains, Mac, terminal]

---
Shadowsocks doesn't work in terminal. 
<!-- more -->

The offical solution provided by [https://github.com/shadowsocks/shadowsocks/wiki/Using-Shadowsocks-with-Command-Line-Tools](https://github.com/shadowsocks/shadowsocks/wiki/Using-Shadowsocks-with-Command-Line-Tools). 

 Caution: you need to change '1080'  to your own Local Socks5 Listen Port according to Shadowsocks preference. 



But it still not work because the SIP(System Integrity Protection) introduced by Apple recently.  Luckily, we can disable it according [this](https://developer.apple.com/library/archive/documentation/Security/Conceptual/System_Integrity_Protection_Guide/ConfiguringSystemIntegrityProtection/ConfiguringSystemIntegrityProtection.html).

<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

