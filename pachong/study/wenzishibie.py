from aip import AipOcr

"""你的APPID AK SK"""
APP_ID = "22757919"
API_KEY = "Gfn6BNla5m2TMZyx8MUqti6n"
SECRET_KEY = "DurmXlvpROitrrOK8k8ToS7pRzIORyWs"
client = AipOcr(APP_ID, API_KEY, SECRET_KEY)
with open('code.png', 'rb') as f:
    image = f.read()  # image就是这张图片的二进制内容
    text = client.basicAccurate(image)  # 调用百度的接口帮我们识别图片的内容
    print(text)
    result = text['words_result']  # 获取返回内容的字典
    answer = result[0]['words']
    print(answer)
