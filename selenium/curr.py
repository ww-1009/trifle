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
passWord_tag.send_keys('86697709Pp')
btn1 = bro.find_element_by_xpath('//*[@id="fm1"]/div[4]/div/input[5]')
btn1.click()
sleep(2)
btn2 = bro.find_element_by_xpath('//*[@id="shortcutx"]/div[2]/a')
btn2.click()
sleep(2)
btn3 = bro.find_element_by_xpath('//*[@id="MLeft"]/div/ul/li/a/div')
btn3.click()
sleep(2)
btn4 = bro.find_element_by_xpath('/html/body/div[2]/div/div[3]/div[1]/div/table[2]/tbody/tr[1]/td[3]/div[2]/a')
btn4.click()
sleep(2)
btn5 = bro.find_element_by_xpath('//*[@id="electIndexNotice0"]/div[3]/a')
btn5.click()
n = bro.window_handles
bro.switch_to.window(n[1])
sleep(2)
btn_could_select = bro.find_element_by_xpath('/html/body/div[12]/div[1]/div[2]')
btn_could_select.click()
sleep(2)
search_lesson_code = bro.find_element_by_xpath('//*[@id="electableLessonList"]/thead/tr[1]/th[2]/div/input')
search_lesson_code.send_keys('2100')
sleep(2)
search_lesson_code.send_keys(Keys.ENTER)
sleep(2)
text = '上限人数已满，请稍后再试'
index = 1
while text == '上限人数已满，请稍后再试':
    btn_select = bro.find_element_by_xpath('//*[@id="lesson435828"]/td[12]/a')
    btn_select.click()
    alert = bro.switch_to.alert
    text = alert.text
    alert.accept()
    index += 1
    bro.switch_to.window(n[1])
    sleep(0.5)
    print('这是第{}次'.format(index))
