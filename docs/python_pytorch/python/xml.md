本文主要介绍利用 python 中的 xml.etree.ElementTree 解析xml.





一般是

```
import xml.etree.cElementTree as ET # python2
import xml.etree.ElementTree as ET # python3
```

## xml

先通过一个 xml 例子, 明确 xml 的*概念*.

```
<bookstore>
<book category="COOKING">
  <title lang="en">Everyday Italian</title> 
  <author>Giada De Laurentiis</author> 
  <year>2005</year> 
  <price>30.00</price> 
</book>
<book category="CHILDREN">
  <title lang="en">Harry Potter</title> 
  <author>J K. Rowling</author> 
  <year>2005</year> 
  <price>29.99</price> 
</book>
</bookstore>
```

XML 文档形成一种树结构, \<bookstore> 是根节点, 也叫根元素, bookstore 是 tag. \<book category=”COOKING”> 是子节点, category 是 attribute, Everyday Italian 是 text.

## 导入 xml

导入 xml 数据有两种方式, 一种是从文本文件, 一种是从字符串

```
tree = ET.parse(' book_data.xml')
root = tree.getroot()

root = ET.fromstring(book_data_as_string)
```

## 遍历与寻找

```python
for book in root.iter('book'):
    title_node = book.find('name')
    book_title = title_node.text
    book_lang = title_node.attrib
```

