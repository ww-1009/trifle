from selenium import webdriver
from time import sleep
from selenium.webdriver import ChromeOptions
from selenium.webdriver.common.keys import Keys



option = ChromeOptions()
option.add_experimental_option('excludeSwitches', ['enable-automation'])
bro = webdriver.Chrome('./chromedriver.exe', options=option)
bro.get('http://192.168.253.68/appointment/appointment.aspx')
userName_tag = bro.find_element_by_id('txtid')
passWord_tag = bro.find_element_by_id('txtpwd')
userName_tag.send_keys('191470149')
passWord_tag.send_keys('191470149')
btn_login = bro.find_element_by_xpath('//*[@id="btnlogin"]')
btn_login.click()
start_date = bro.find_element_by_xpath('//*[@id="txtbDate"]')
end_date = bro.find_element_by_xpath('//*[@id="txteDate"]')
start_date.send_keys('2020-12-18')
end_date.send_keys('2020-12-25')
btn_search = bro.find_element_by_xpath('//*[@id="btnsearch"]')
btn_search.click()
