import urllib.request
import urllib.parse
import urllib.error


def first():
    request = urllib.request.Request('http://python.org')
    response = urllib.request.urlopen(request)
    print(response.read().decode('utf-8'))


def second():
    url = 'http://httpbin.org/post'
    headers = {
        'User-Agent': 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
        'Host': 'httpbin.org'}
    dict = {'name': 'Germey'
            }
    data = bytes(urllib.parse.urlencode(dict), encoding='utf-8')
    request = urllib.request.Request(url=url, data=data, headers=headers, method='POST')
    response = urllib.request.urlopen(request)
    request.add_header('User-Agent', 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)')
    print(response.read().decode('utf-8'))


def third():
    try:
        response = urllib.request.urlopen('http://cuiqingcai.com/index.htm')
    except urllib.error.HTTPError as e:
        print(e.reason, e.code, e.headers, sep='\n')
    # URLError 是 HTTPError 的父类，所以我们可以先选择捕获子类的错误，再去捕获父类的错误，所以上述代码更好的写法如下：


def forth():
    try:
        response = urllib.request.urlopen('http://cuiqingcai.com/index.htm')
    except urllib.error.HTTPError as e:
        print(e.reason, e.code, e.headers, sep='\n')
    except urllib.error.URLError as e:
        print(e.reason)
    else:
        print('Request Successfully')



if __name__ == '__main__':
    forth()
