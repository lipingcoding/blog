```python 
import re
import requests
pattern = re.compile(r'<div class="pl2">.*?<a href="(.*?)".*?title="(.*?)".*?<p class="pl">(.*?)</p>', re.S)
data = {'start':0}
output = open('douban_book_top250.txt','a')
for i in range(10):
    data['start'] = i * 25
    response = requests.get('http://book.douban.com/top250',params = data)
    tmp = re.findall(pattern, response.text)
    for link, title, info in tmp:
        print('%-50s %-30s %-30s' %(link.strip(), title.strip(), info.strip()),file=output)

```

