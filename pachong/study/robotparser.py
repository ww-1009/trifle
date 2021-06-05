from urllib.robotparser import RobotFileParser
# 用于分析robots.txt 可以根据某网站的robots.txt文件来判断一个抓取爬虫时都有权限来抓取这个网页


rp = RobotFileParser()
rp.set_url('https://www.cnblogs.com/robots.txt')# 设置robots.txt连接
rp.read()
print(rp.can_fetch('*', 'http://www.cnblogs.com'))

