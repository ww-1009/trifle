import requests
from PIL import Image
from lxml import etree
from aip import AipOcr


def getCodeText():
    """你的APPID AK SK"""
    APP_ID = "22757919"
    API_KEY = "Gfn6BNla5m2TMZyx8MUqti6n"
    SECRET_KEY = "DurmXlvpROitrrOK8k8ToS7pRzIORyWs"
    client = AipOcr(APP_ID, API_KEY, SECRET_KEY)
    with open('code.png', 'rb') as f:
        image = f.read()
        text = client.basicAccurate(image)  # 调用百度的接口帮我们识别图片的内容
        result = text['words_result']  # 获取返回内容的字典
        answer = result[0]['words']
        print(answer)




headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/86.0.4240.75 Safari/537.36'}

url = 'https://so.gushiwen.cn/user/login.aspx?from=http://so.gushiwen.cn/user/collect.aspx'
page_text = requests.get(url=url, headers=headers).text
tree = etree.HTML(page_text)
code_img_src = 'https://so.gushiwen.cn/RandCode.ashx?t=1604481810896' + tree.xpath('//*[@id="imgCode"]/@src')[0]
img_data = requests.get(url=code_img_src, headers=headers).content
with open('./code.jpg', 'wb') as fp:
    fp.write(img_data)
im = Image.open('code.jpg')


def iter_frames(im):
    try:
        i = 0
        while 1:
            im.seek(i)
            imframe = im.copy()
            if i == 0:
                palette = imframe.getpalette()
            else:
                imframe.putpalette(palette)
            yield imframe
            i += 1
    except EOFError:
        pass


for i, frame in enumerate(iter_frames(im)):
    frame.save('code.png', **frame.info)
getCodeText()
