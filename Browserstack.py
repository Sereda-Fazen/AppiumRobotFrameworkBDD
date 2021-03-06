# coding=utf8
import os
from time import sleep
from xml.dom import minidom
import os, errno
from SeleniumLibrary.keywords import element
from appium import webdriver
from appium.webdriver.common.mobileby import MobileBy
from selenium.webdriver import TouchActions
from selenium.webdriver.common.by import By

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from selenium.common.exceptions import NoSuchElementException

# curl -u "eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi" -X POST "https://api.browserstack.com/app-automate/upload" -F "file=@/home/alex/Robot Framework/AppiumRobotFrameworkBDD/app/Первый.apk"
import json
from pprint import pprint


class Browserstack(object):
    driver = None

    def __new__(cls, build, device, app):
        desired_caps_br = {
            "build": build,
            "realMobile": True,
            "device": device,
            "app": app,
            "browserstack.debug": True,
            "browserstack.video": True
        }
        if cls.driver is None:
            cls.driver = webdriver.Remote('http://eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi@hub-cloud.browserstack.com'
                                          '/wd/hub', desired_caps_br)
        return super().__new__(cls)

    def __init__(self, build, device, app):
        pass

    # driver = None
    #
    # def __new__(cls, device):
    #     desired_caps = {
    #         "unicodeKeyboard": True,
    #         "platformName": 'Android',
    #         "deviceName": device,
    #         "app": "/home/alex/RobotFramework/AppiumRobotFrameworkBDD/app/Первый_5.5.14(92).apk",
    #         "resetKeyboard": True
    #     }
    #     if cls.driver is None:
    #         cls.driver = webdriver.Remote('http://0.0.0.0:4723/wd/hub', desired_caps)
    #     return super(Browserstack, cls).__new__(cls, device)
    #
    # def __init__(self, device):
    #     pass

    def andr_click(self, click_main, name):
        try:
            search_input = WebDriverWait(self.driver, 40).until(
                EC.element_to_be_clickable((MobileBy.XPATH, click_main)),
                message="Element - '" + click_main + "' did not appear in 20 seconds").click()
        except:
            self.take_screens(name)
            raise

    def show_text(self, loc, name):
        try:
            text_sh = WebDriverWait(self.driver, 10).until(
                EC.element_to_be_clickable((MobileBy.XPATH, loc)),
                message="Element - '" + loc + "' did not appear in 20 seconds")
        except:
            self.take_screens(name)
            raise

    def show_text_id(self, loc, name):
        try:
            text_id = WebDriverWait(self.driver, 30).until(
                EC.element_to_be_clickable((MobileBy.ID, loc)),
                message="Element - '" + loc + "' did not appear in 20 seconds")
        except:
            self.take_screens(name)
            raise

    def click_id(self, id_news, name):
        try:
            cl_id = WebDriverWait(self.driver, 20).until(
                EC.element_to_be_clickable((MobileBy.ID, id_news)),
                message="Element - '" + id_news + "' did not appear in 20 seconds").click()
        except:
            self.take_screens(name)
            raise

    def send_text(self, id_news, text, name):
        try:
            wait = WebDriverWait(self.driver, 5).until(
                EC.element_to_be_clickable((MobileBy.ID, id_news)),
                message="Element - '" + id_news + "' did not appear in 20 seconds")
            wait.send_keys(text)
        except:
            self.take_screens(name)

    def input(self, id, text):
        address = self.driver.find_element_by_id(id)
        address.send_keys(text)

    def clear_field(self, loc):
        clear = self.driver.find_element_by_id(loc).clear()

    def element_does_not_contain(self, elem):
        try:
            wait_el = WebDriverWait(self.driver, 5).until(
                EC.invisibility_of_element_located((By.NAME, elem)),
                message="Element - '" + elem + "' is not visible in 20 seconds")
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def element_does_not_contain_xpath(self, elem, name):
        try:
            wait_xp = WebDriverWait(self.driver, 5).until(
                EC.invisibility_of_element_located((By.XPATH, elem)),
                message="Element - '" + elem + "' is not visible in 20 seconds")
        except:
            self.take_screens(name)
            raise


    def make_screen(self, screens):
        directory = '%s/Results/Screens/' % os.getcwd()
        file_name = screens
        self.driver.save_screenshot(directory + file_name)

    def check_load(self, loc1, loc2):
        try:
            cancel_load = WebDriverWait(self.driver, 10).until(
                EC.element_to_be_clickable((MobileBy.XPATH, loc1)),
                message="Element - '" + loc1 + "' did not appear in 20 seconds")
        except:
            remove_load = WebDriverWait(self.driver, 10).until(
                EC.element_to_be_clickable((MobileBy.XPATH, loc2)),
                message="Element - '" + loc2 + "' did not appear in 20 seconds")

    def app_background(self):
        self.driver.background_app(3)

    def launch_app(self):
        self.driver.launch_app()

    def driver_quite(self):
        self.driver.quit()

    def driver_wait(self):
        sleep(2)

    def driver_go_back(self):
        self.driver.back()

    def search(self, id_news, item, episod, name, title):
        xmldoc = minidom.parse('search.xml')
        itemlist = xmldoc.getElementsByTagName(item)
        linelist = xmldoc.getElementsByTagName(episod)
        print(linelist)
        # exit()
        for s in itemlist:
            test = s.attributes[name].value
            self.driver.find_element_by_id(id_news).send_keys(test)

            for e in linelist:
                episod = e.attributes[title].value
                self.andr_sc(episod)

                WebDriverWait(self.driver, 20).until(
                    EC.element_to_be_clickable((MobileBy.XPATH, "//android.widget.TextView[@text='%s']" % episod)),
                    message="Element - '" + episod + "' did not appear in 20 seconds")

    def scroll_to(self, t):
        _ = 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("%s").instance(0));' % t
        self.driver.find_element_by_android_uiautomator(_.encode('utf8'))

    def andr_sc(self, el):
        self.driver.find_element_by_android_uiautomator(
            'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("' + el + '").instance(0));')

    def background(self):
        for x in range(100):
            self.driver.background_app(2)

    def take_screens(self, name):
        try:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = name + '.png'
            self.driver.save_screenshot(directory + file_name)
            raise
        except OSError as e:
            if e.errno != errno.EEXIST:
                raise
