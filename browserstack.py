# coding=utf8
import os
from time import sleep

from appium.webdriver.common.touch_action import TouchAction
from appium import webdriver
from appium.webdriver.common.mobileby import MobileBy
from django.views.decorators.http import condition, logger
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# curl - u
# "eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi" - X
# POST
# https: // api.browserstack.com / app - automate / upload - F
# "file=@/home/alex/Robot Framework/MobileTest/app/Первый_com.apk


desired_caps_br = {
    "build": "First Channel",
    "realMobile": True,
    "device": "Samsung Galaxy S7",
    "app": "bs://a3f8e80e6bb690d064b18a64197b7d9bc3ef369b",
    "browserstack.debug": True,
    "browserstack.video": True
}
driver = webdriver.Remote('http://eugeneponomarenk1:R5AbyDrPiiBnt3pyaRUi@hub-cloud.browserstack.com/wd/hub',
                          desired_caps_br)


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


def scroll_to(el):
    driver.find_element_by_android_uiautomator(
        'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("'+el+'").instance(0));')


def make_screen(screens):
    directory = '%s/Results/Screens/' % os.getcwd()
    file_name = screens
    driver.save_screenshot(directory + file_name)


def driver_quite():
    driver.quit()


def driver_wait():
    sleep(2)


def driver_go_back():
    driver.back()
