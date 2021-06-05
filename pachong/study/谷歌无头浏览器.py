from selenium import webdriver
from time import sleep
from selenium.webdriver.chrome.options import Options
from selenium.webdriver import ChromeOptions
chrome_options = Options()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--disable-gpu')
option = ChromeOptions()
option.add_experimental_option('excludeSwitches',['enable-automation'])
bro = webdriver.Chrome(executable_path='./chromedriver.exe', options=chrome_options)
bro.get('https://www.baidu.com')
print(bro.page_source)
sleep(2)
bro.quit()