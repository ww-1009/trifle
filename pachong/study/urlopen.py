import urllib.request
import urllib.parse
import urllib.error
import socket


def first():
    response = urllib.request.urlopen('https://www.python.org')
    print(response.read().decode('utf-8'))
    print(type(response))
    # class http.client.HTTPResponse


'''read方法可以得到返回的网页内容,status属性可以得到返回结果的状态码'''


def second():
    response = urllib.request.urlopen('https://www.python.org')
    print(response.status)
    print(response.getheaders())
    print(response.getheaders('Server'))
    # 200代表请求成功 404代表未找到网页


def third():
    data = bytes((urllib.parse.urlencode({'word': 'hello'})), encoding='utf-8')
    response = urllib.request.urlopen('http://httpbin.org/post', data=data)
    response_ = urllib.request.urlopen('http://httpbin.org')
    print(response.read())
    print(response_.read())
    # 输入参数data之后就是post不是get 用于添加数据
    # 如果输入的data是字典类型要用urlencode进行编码 这个参数是字节型


def forth():
    try:
        response = urllib.request.urlopen('http://httpbin.org', timeout=0.1)
    except urllib.error.URLError as e:
        if isinstance(e.reason, socket.timeout):
            print('Time out')


if __name__ == '__main__':
    forth()
