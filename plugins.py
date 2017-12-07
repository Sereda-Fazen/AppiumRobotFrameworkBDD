# coding=utf8
import os
from telnetlib import EC
from xml.dom import minidom

from appium.webdriver.common.mobileby import MobileBy
from selenium.webdriver.support.wait import WebDriverWait

from keywords import driver


def search(id_news):
 xmldoc = minidom.parse('search.xml')
 itemlist = xmldoc.getElementsByTagName('item')
 for s in itemlist:
    test = s.attributes['name'].value
    driver.find_element_by_id(id_news).send_keys(test)
    driver.find_element_by_id('com.ipspirates.ort:id/item_tele_episode_title').is_displayed()
    driver.find_element_by_name()
