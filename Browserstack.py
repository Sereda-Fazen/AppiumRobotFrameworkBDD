# coding=utf8
import os
from time import sleep

from SeleniumLibrary.keywords import element
from appium import webdriver
from appium.webdriver.common.mobileby import MobileBy
from selenium.webdriver import TouchActions
from selenium.webdriver.common.by import By

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from selenium.common.exceptions import NoSuchElementException


# curl -u "eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi" -X POST "https://api.browserstack.com/app-automate/upload" -F "file=@/home/alex/Robot Framework/AppiumRobotFrameworkBDD/app/Первый.apk"


class Browserstack(object):

    def __init__(self, device, build):
        self._conn = desired_caps_br = {
            "build": build,
            "realMobile": True,
            "device": device,
            "app": "bs://397fecef691a22fd5728da7783fd74aa4361866d",
            "browserstack.debug": True,
            "browserstack.video": True
        }
        self.driver = webdriver.Remote(
            'http://eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi@hub-cloud.browserstack.com/wd/hub',
            desired_caps_br)

    def andr_click(self, click_main):
        try:
            search_input = WebDriverWait(self.driver, 40).until(
                EC.element_to_be_clickable((MobileBy.XPATH, click_main)),
                message="Element - '" + click_main + "' did not appear in 20 seconds").click()
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def show_text(self, loc):
        try:
            text_sh = WebDriverWait(self.driver, 10).until(
                EC.element_to_be_clickable((MobileBy.XPATH, loc)),
                message="Element - '" + loc + "' did not appear in 20 seconds")
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def show_text_id(self, loc):
        try:
            text_id = WebDriverWait(self.driver, 40).until(
                EC.element_to_be_clickable((MobileBy.ID, loc)),
                message="Element - '" + loc + "' did not appear in 20 seconds")
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def click_id(self, id_news):
        try:
            cl_id = WebDriverWait(self.driver, 20).until(
                EC.element_to_be_clickable((MobileBy.ID, id_news)),
                message="Element - '" + id_news + "' did not appear in 20 seconds").click()
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            driver.save_screenshot(directory + file_name)
            raise

    def send_text(self, id_news, text):
        try:
            wait = WebDriverWait(self.driver, 5).until(
                EC.element_to_be_clickable((MobileBy.ID, id_news)),
                message="Element - '" + id_news + "' did not appear in 20 seconds")
            wait.send_keys(text)
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def input(self,id, text):
        address = self.driver.find_element_by_id(id)
        address.send_keys(text)

    def clear_field(self,loc):
        clear = self.driver.find_element_by_id(loc).clear()

    def element_does_not_contain(self,elem):
        try:
            wait_el = WebDriverWait(self.driver, 5).until(
                EC.invisibility_of_element_located((By.NAME, elem)),
                message="Element - '" + elem + "' is not visible in 20 seconds")
        except:
            directory = '%s/Results/Errors/' % os.getcwd()
            file_name = '1.png'
            self.driver.save_screenshot(directory + file_name)
            raise

    def make_screen(self,screens):
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

#