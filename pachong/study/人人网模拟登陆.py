import requests
from aip import AipOcr
from lxml import etree
import json
if __name__ == '__main__':
    def getCodeText(img):
        """你的APPID AK SK"""
        APP_ID = "22757919"
        API_KEY = "Gfn6BNla5m2TMZyx8MUqti6n"
        SECRET_KEY = "DurmXlvpROitrrOK8k8ToS7pRzIORyWs"
        client = AipOcr(APP_ID, API_KEY, SECRET_KEY)
        with open(img, 'rb') as f:
            image = f.read()
            text = client.basicAccurate(image)  # 调用百度的接口帮我们识别图片的内容
            print(text)
            result = text['words_result']  # 获取返回内容的字典
            answer = result[0]['words']
            return answer


    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      'Chrome/86.0.4240.75 Safari/537.36'}
    url = 'http://www.renren.com/SysHome.do'
    page_text = requests.get(url=url, headers=headers).text
    tree = etree.HTML(page_text)
    src_url = tree.xpath('//*[@id="verifyPic_login"]/@src')[0]
    img_data = requests.get(url=src_url, headers=headers).content
    with open('renren.jpg', 'wb') as fp:
        fp.write(img_data)
    answer = getCodeText('renren.jpg').strip()
    print(answer)
    login_url = 'http://www.renren.com/ajaxLogin/login?1=1&uniqueTimestamp=20201051131812'
    data = {
        'email': '1519027662@qq.com',
        'icode': answer,
        'origURL': 'http://www.renren.com/home',
        'domain': 'renren.com',
        'key_id': '1',
        'captcha_type': 'web_login',
        'password': '7233d6e845d7dd1fc838c316d1339738db6eb22e2ce06825d6bf7a32f93fe8e7',
        'rkey': 'fce20fc2eeff347330a10f3c31a67312',
        'f': ''
    }
    login_page_text = requests.post(url=login_url, headers=headers, data=data).text
    user_dict = json.loads(login_page_text)
    home_url = user_dict['homeUrl']
    page_text_home = requests.get(url=home_url, headers=headers).text
    with open('renren.html', 'w', encoding='utf-8') as fp:
        fp.write(page_text_home)

