*** Settings ***
Resource          browserstack_resoure.robot
Force Tags         BrowserStack




*** Test Cases ***
#


Поиск в списке телепроектов
  Given Перейти в разделы (гамбургер)
   And Я перешел по пункту меню "Телепроекты"
   And Я нажал на любой телепроект из списка
   And Я нажал на любое видео из ленты выбранного телепроекта

Проверка работы многопоточного поиска
  Given Поиск многопоточный в телепроекте

