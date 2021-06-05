from selenium import webdriver
from time import sleep

bro = webdriver.Chrome(executable_path='./chromedriver.exe')
bro.get('https://www.taobao.com/')
search_input = bro.find_element_by_id('q')
search_input.send_keys('Iphone')
bro.execute_script('window.scrollTo(0,document.body.scrollHeight)')
sleep(2)
btn = bro.find_element_by_css_selector('.btn-search')
btn.click()
bro.get('https://www.baidu.com')
sleep(2)
bro.back()
sleep(2)
bro.forward()
sleep(5)
bro.quit()