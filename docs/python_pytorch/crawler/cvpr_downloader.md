# CVPR 2019 Paper Downloader

CVPR 和 ICCV 的论文在 [CVF](http://openaccess.thecvf.com/menu.py) 的网站上可以免费下载, 本文通过爬取 [CVF](http://openaccess.thecvf.com/menu.py) 批量下载 CVPR 2019 的论文, ICCV 或者 CVPR的其他年份都可能进行类似下载.

将 [CVPR2019](http://openaccess.thecvf.com/CVPR2019.py) 页面下载下来, 保存在 `../HTML/CVPR_Open_Access.html` 中. 然后运行如下脚本, 注意新建 papers 目录. 

```python
import os
import bs4
import requests


def my_check(paper_name, dir='../papers/'):
    title = paper_name
    title = title.strip().split()[-1]
    title = title.split('/')[-1]
    pdfs = os.listdir(dir)
    if title in pdfs:
        print('Skiped %s'%title)
        return True
    else:
        return False

CVPR_OpenAccess = open('../HTML/CVPR_Open_Access.html')
CVPR_OpenAccess_bs4 = bs4.BeautifulSoup(CVPR_OpenAccess)


Article_Dic = {}
DownloadRegion = CVPR_OpenAccess_bs4.find('dl')
currentPointer = DownloadRegion.find_next('dt')


while True:
    paperName = currentPointer.a.string
    currentPointer = currentPointer.find_next('dd')
    currentPointer = currentPointer.find_next('dd')

    if my_check(currentPointer.a['href']):
        continue
    else:
        Article_Dic[paperName] = currentPointer.a['href']
        print('Downloading from ' + Article_Dic[paperName])
        try:
            pdf_data = requests.get('http://openaccess.thecvf.com/'+Article_Dic[paperName])
        except:
            print('Failed to get '+Article_Dic[paperName])
            continue
        filename = os.path.basename(Article_Dic[paperName])
        pdf_file = open('../Papers/' + filename, 'wb')
        pdf_file.write(pdf_data.content)
        pdf_file.close()
        total = total + 1

    currentPointer = currentPointer.find_next('dt')
    if currentPointer is None:
        break

print('Parcer CVPR_OpenAccess List Done')
```

代码的思路很简单, 直接在 HTML 中寻找文章的标题和 PDF 的下载链接.