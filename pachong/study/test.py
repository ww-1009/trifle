from selenium import webdriver
from time import sleep
from selenium.webdriver import ChromeOptions
from selenium.webdriver.common.keys import Keys

option = ChromeOptions()
option.add_experimental_option('excludeSwitches', ['enable-automation'])
bro = webdriver.Chrome('./chromedriver.exe', options=option)
bro.get('https://cas.paas.lixin.edu.cn/cas/login?service=https%3A%2F%2Flxjw.lixin.edu.cn%2Fcas%2Flogin')
userName_tag = bro.find_element_by_id('username')
passWord_tag = bro.find_element_by_id('password')
userName_tag.send_keys('181340638')
sleep(2)
passWord_tag.send_keys('86697709Pp')
sleep(2)
btn1 = bro.find_element_by_xpath('//*[@id="fm1"]/div[4]/div/input[5]')
btn1.click()
sleep(2)
btn2 = bro.find_element_by_xpath('//*[@id="shortcutx"]/div[2]/a')
btn2.click()
sleep(2)
btn3 = bro.find_element_by_xpath('//*[@id="MLeft"]/div/ul/li/a')
btn3.click()
sleep(2)
btn4 = bro.find_element_by_xpath('//*[@id="MLeft"]/div/table[2]/tbody/tr[1]/td[3]/div[2]/a')
btn4.click()
sleep(2)
btn5 = bro.find_element_by_xpath('//*[@id="electIndexNotice0"]/div[3]/a')
btn5.click()
sleep(2)
n = bro.window_handles
bro.switch_to.window(n[1])
btn6 = bro.find_element_by_xpath('/html/body/div[12]/div[1]/div[2]')
btn6.click()
sleep(2)
search = bro.find_element_by_xpath('//*[@id="electableLessonList"]/thead/tr[1]/th[5]/div/input')
search.send_keys('专业')
search.send_keys(Keys.ENTER)
btn_xuanke = bro.find_element_by_xpath('//*[@id="lesson428491"]/td[12]/a')
btn_xuanke.click()
alert = bro.switch_to_alert()
alert.accept()



