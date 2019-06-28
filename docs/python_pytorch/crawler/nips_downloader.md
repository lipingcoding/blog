# NIPS 2018论文下载

[NIPS 2018](https://nips.cc/Conferences/2018/Schedule) 论文目前可以免费下载, ICML, ICLR 的网站结构和 NIPS 几乎一模一样, 只需要简单修改, 就可以将下面的代码用于 ICML 和 ICLR 的论文爬取.

setup.py 

```python
import requests
import os


if not os.path.isdir('papers'):
    os.mkdir('papers')

if not os.path.isfile('NIPs.html'):
    response = requests.get('https://nips.cc/Conferences/2018/Schedule')
    with open('NIPS2018.html', 'w') as f:
        #print(response.text)
        f.write(response.text)
```



main.py

```python
import os
from bs4 import BeautifulSoup
import requests
import re
import pickle
import threading
import time


def convert_link(forum_link):
    response = requests.get(forum_link)
    soup = BeautifulSoup(response.text)
    tag = soup.find(text='[PDF]')
    return 'http://papers.nips.cc' + tag.parent.get('href')


soup = BeautifulSoup(open('NIPS2018.html'), 'html.parser')
tags = soup.find_all(title='Paper')

def link_and_output(tag):
    href = tag.get('href')
    ptag = tag.parent.parent.parent.parent
    title = ptag.find(class_='maincardBody').text
    output = 'papers/' + title + '.pdf'
    return (href, output)
    

infos = set()
print('Preparing infos...')
for tag in tags:
    info = link_and_output(tag)
    if info:
        infos.add(info)
infos = list(infos)
print('%d to download'%len(infos))
# print('Tags len %d'%len(tags))
# print(infos[-10:])
# print(infos)
# for info in infos[:5]:
#     print(convert_link(info[0]), info[1])
# exit()

max_thread_num = 10
max_thread_ctx = threading.Semaphore(max_thread_num)

class download_thread(threading.Thread):
    def __init__(self, info):
        super(download_thread, self).__init__()
        self.link = info[0]
        self.output = info[1]

    def run(self):
        with max_thread_ctx:
            if os.path.isfile(self.output):
                return
            download_link = convert_link(self.link)
            response = requests.get(download_link)
            with open(self.output, 'wb') as f:
                f.write(response.content)


ths = [download_thread(info) for info in infos]
t = time.time()
for th in ths:
    th.start()
for th in ths:
    th.join()
print('Used %d'%(time.time() - t))
```

从索引页面, 获取下载链接和论文标题, 注意此时获得的链接只是下载页面的链接, 并非最终的 pdf 下载链接, 需要去下载页面才能获得最终的 pdf 下载链接.