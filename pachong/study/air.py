import requests
from lxml import etree
if __name__ == '__main__':
    url = 'https://www.aqistudy.cn/historydata/'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      'Chrome/86.0.4240.75 Safari/537.36'}

    page_text = requests.get(url=url, headers=headers).text
    tree = etree.HTML(page_text)
    all_city_names = []
    host_li_list = tree.xpath('//div[@class="bottom"]/ul/li')
    print(host_li_list)
    for li in host_li_list:
        hot_city_name = li.xpath('./a/text()')[0]
        all_city_names.append(hot_city_name)
    city_names_list = tree.xpath('.//div[@class="bottom"]/ul/div[2]/li')
    for li in city_names_list:
        city_name = li.xpath('./a/text()')[0]
        all_city_names.append(city_name)
    print(all_city_names, len(all_city_names))




