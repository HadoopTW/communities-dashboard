# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
from bs4 import BeautifulSoup
import unittest, time, re, os

class HadoopTWFBMembers(unittest.TestCase):
    def setUp(self):
        _browser_profile = webdriver.FirefoxProfile()
	_browser_profile.set_preference("dom.webnotifications.enabled", False)
	self.driver = webdriver.Firefox(firefox_profile=_browser_profile)
        self.driver.implicitly_wait(300)
        self.base_url = "https://www.facebook.com/"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_hadoop_tw_fb_members(self):
        driver = self.driver
        fb_email = os.environ.get("FB_EMAIL")
        fb_pass  = os.environ.get("FB_PASS")
        
	f1=open('./hadoop-tw.html', 'w+')

        driver.get("https://www.facebook.com/login")
        driver.find_element_by_id("email").clear()
        driver.find_element_by_id("email").send_keys(fb_email)
        driver.find_element_by_id("pass").clear()
        driver.find_element_by_id("pass").send_keys(fb_pass)
        driver.find_element_by_id("loginbutton").click()

        driver.get("https://www.facebook.com/groups/hadoop.tw/members")
        driver.execute_script('window.scrollTo(0, document.body.scrollHeight);')
	time.sleep(1)
        while BeautifulSoup(driver.page_source,"lxml").select(".uiMorePagerPrimary") != [] :
            for i in range(1,10):
	        driver.execute_script('window.scrollTo(0, document.body.scrollHeight);')
		time.sleep(1)

	soup = BeautifulSoup(driver.page_source,"lxml")
        print >>f1, soup.prettify().encode('utf-8')
    
    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException as e: return False
        return True
    
    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException as e: return False
        return True
    
    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True
    
    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
