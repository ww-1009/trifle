import scrapy


class FirstSpider(scrapy.Spider):
    name = 'first'
    allowed_domains = ['www.xxx.com']
    start_urls = ['http://www.baidu.com/']

    def parse(self, response):
        print(response)
        pass
