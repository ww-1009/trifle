import numpy as np
import requests
import re
import os
if __name__ == '__main__':
    if not os.path.exists('./qiutuLibs'):
        os.mkdir('./qiutuLibs')
    url = 'https://www.qiushibaike.com/imgrank/'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      'Chrome/86.0.4240.75 Safari/537.36'}
    page_text = requests.get(url=url, headers=headers).text
    ex = '<div class="thumb">.*?<img src="(.*?)" alt.*?</div>'
    img_src_list = re.findall(ex, page_text, re.S)
    for src in img_src_list:
        src = "https:" + src
        img_data = requests.get(url=src, headers=headers).content
        img_name = src.split('/')[-1]
        imgPath = './qiutuLibs/' + img_name
        with open(imgPath, 'wb') as fp:
            fp.write(img_data)
            print(img_name, '下载成功')