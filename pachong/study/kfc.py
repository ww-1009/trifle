import requests
import json

if __name__ == '__main__':
    post_url = 'http://www.kfc.com.cn/kfccda/ashx/GetStoreList.ashx?op=keyword'
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                             'Chrome/86.0.4240.75 Safari/537.36'}
    data = {
        'cname': '',
        'pid': '',
        'keyword': '上海',
        'pageIndex': 1,
        'pageSize': 10
    }
    # get param post data
    response = requests.post(url=post_url, headers=headers, data=data)
    print(response.text)
