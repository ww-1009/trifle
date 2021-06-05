import requests
from lxml import etree
import re
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/86.0.4240.75 Safari/537.36'}

url = 'https://www.pearvideo.com/category_5'
page_text = requests.get(url=url, headers=headers).text
tree = etree.HTML(page_text)
li_list = tree.xpath('//ul[@id="listvideoListUl"]/li')
for li in li_list:
    detail_url = 'https://www.pearvideo.com/'+li.xpath('./div/a/@href')[0]
    name = li.xpath('./div/a/div[2]/text()')[0]+'.mp4'
    detail_page_text = requests.get(url=detail_url, headers=headers).text
    ex = 'srcUrl="(.*?)",vdoUrl'
    video_url = re.findall(ex, detail_page_text)[0]
    print(video_url)

