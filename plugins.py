# coding=utf8
from telnetlib import EC
from xml.dom import minidom
from appium import webdriver
from appium.webdriver.common.mobileby import MobileBy


from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from Br import driver


def search(id_news, item, episod, name, title):
    xmldoc = minidom.parse('search.xml')
    itemlist = xmldoc.getElementsByTagName(item)
    linelist = xmldoc.getElementsByTagName(episod)
    print(linelist)
    # exit()
    for s in itemlist:
        test = s.attributes[name].value
        driver.find_element_by_id(id_news).send_keys(test)

        for e in linelist:
            episod = e.attributes[title].value
            scroll_to(episod)

            WebDriverWait(driver, 20).until(
                EC.element_to_be_clickable((MobileBy.XPATH, "//android.widget.TextView[@text='%s']" % episod)),
                message="Element - '" + episod + "' did not appear in 20 seconds")


def scroll_to(t):
    _ = 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("%s").instance(0));' % t
    driver.find_element_by_android_uiautomator(_.encode('utf8'))


def andr_sc(el):
    driver.find_element_by_android_uiautomator(
        'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("'+el+'").instance(0));')


def background():
    for x in range(100):
        driver.background_app(2)


