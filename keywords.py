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



# desired_caps_br = {
#     "build": "First Channel",
#     "realMobile": True,
#     "device": data[0]['device'],
#     "app": data[0]['app'],
#     "browserstack.debug": True,
#     "browserstack.video": True
# }
# driver = webdriver.Remote('http://eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi@hub-cloud.browserstack.com/wd/hub',
#                           desired_caps_br)

# desired_caps = {}
# desired_caps['platformName'] = data[0]['platformName']
# desired_caps['platformVersion'] = '6.0'
# desired_caps['deviceName'] = data[0]['deviceName']
# desired_caps['unicodeKeyboard'] = 'True'
# desired_caps['app'] = data[0]['app']
# desired_caps['resetKeyboard'] = 'True'
# driver = webdriver.Remote('http://0.0.0.0:4723/wd/hub', desired_caps)



import json



desired_caps = {}
desired_caps['unicodeKeyboard'] = 'True'
desired_caps['platformName'] = 'Android'
desired_caps['deviceName'] = 'Android Emulator'
desired_caps['app'] = '/home/alex/RobotFramework/AppiumRobotFrameworkBDD/app/Первый_5.5.13.apk'
desired_caps['resetKeyboard'] = 'True'
driver = webdriver.Remote('http://0.0.0.0:4723/wd/hub', desired_caps)


def andr_click(click_main):
    try:
        search_input = WebDriverWait(driver, 40).until(
            EC.element_to_be_clickable((MobileBy.XPATH, click_main)),
            message="Element - '" + click_main + "' did not appear in 20 seconds").click()
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise


def show_text(loc):
    try:
     text_sh = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((MobileBy.XPATH, loc)),
        message="Element - '" + loc + "' did not appear in 20 seconds")
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise


def show_text_id(loc):
    try:
     text_id = WebDriverWait(driver, 40).until(
        EC.element_to_be_clickable((MobileBy.ID, loc)),
        message="Element - '" + loc + "' did not appear in 20 seconds")
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise


def click_id(id_news):
    try:
        cl_id = WebDriverWait(driver, 20).until(
            EC.element_to_be_clickable((MobileBy.ID, id_news)),
            message="Element - '" + id_news + "' did not appear in 20 seconds").click()
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise


def send_text(id_news, text):
    try:
        wait = WebDriverWait(driver, 5).until(
            EC.element_to_be_clickable((MobileBy.ID, id_news)),
            message="Element - '" + id_news + "' did not appear in 20 seconds")
        wait.send_keys(text)
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise


def input(id, text):
    address = driver.find_element_by_id(id)
    address.send_keys(text)


def clear_field(loc):
    clear = driver.find_element_by_id(loc).clear()


def element_does_not_contain(elem):
    try:
        wait_el = WebDriverWait(driver, 5).until(
          EC.invisibility_of_element_located((By.NAME, elem)),
          message="Element - '" + elem + "' is not visible in 20 seconds")
    except:
        directory = '%s/Results/Errors/' % os.getcwd()
        file_name = '1.png'
        driver.save_screenshot(directory + file_name)
        raise




def make_screen(screens):
    directory = '%s/Results/Screens/' % os.getcwd()
    file_name = screens
    driver.save_screenshot(directory + file_name)


def check_load(loc1, loc2):
     try:
      cancel_load = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((MobileBy.XPATH, loc1)),
        message="Element - '" + loc1 + "' did not appear in 20 seconds")
     except:
      remove_load = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((MobileBy.XPATH, loc2)),
        message="Element - '" + loc2 + "' did not appear in 20 seconds")


def driver_quite():
    driver.quit()


def driver_wait():
    sleep(2)


def driver_go_back():
    driver.back()

