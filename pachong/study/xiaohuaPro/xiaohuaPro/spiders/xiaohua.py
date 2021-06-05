import scrapy


class XiaohuaSpider(scrapy.Spider):
    name = 'xiaohua'
    #allowed_domains = ['www.xxx.com']
    start_urls = ['http://www.521609.com/meinvxiaohua/']

    def parse(self, response):


