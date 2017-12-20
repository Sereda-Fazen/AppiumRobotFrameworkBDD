*** Settings ***
Library           AppiumLibrary    timeout=50
Library           Browserstack.py     ${DEVICE}
#Library           plugins.py
#Library           tests.py
*** Variables ***
${REMOTE_URL}     http://0.0.0.0:4723/wd/hub

*** Keywords ***



Новости
  click_id         com.ipspirates.ort:id/nav_drawer_item_news

Первая новость
  click_id         com.ipspirates.ort:id/item_play_click

Видео новости
  show_text_id         com.ipspirates.ort:id/item_play_click

Описание новости
  show_text_id         com.ipspirates.ort:id/item_news_descr
Дата публикации
  show_text_id         com.ipspirates.ort:id/item_news_title


Перейти детально к описанию
  click_id        com.ipspirates.ort:id/item_news_descr_lay


Блок будильник
  click_id         com.ipspirates.ort:id/action_notify_news

##### Детально для всех разделов   ##################

Поделиться
  show_text_id                 com.ipspirates.ort:id/action_share_show
Полная дата добавления
  show_text_id                 com.ipspirates.ort:id/show_info_date_text
Тайтл
  show_text_id                 com.ipspirates.ort:id/show_info_title_text
Текст
  show_text_id                 com.ipspirates.ort:id/show_info_descr_text

Скачать
  show_text_id                 com.ipspirates.ort:id/show_info_download_bt

Нажать на кнопку сохранить
  click_id                 com.ipspirates.ort:id/show_info_download_bt

Подтверждение об сохранении
  show text             //android.widget.TextView[@text='Сохранить видео на устройство?']
  click id        com.ipspirates.ort:id/buttonDefaultPositive
  driver_wait

Подтверждение об удалении
  show text             //android.widget.TextView[@text='Удалить видео с устройства?']
  click id         com.ipspirates.ort:id/buttonDefaultPositive
  driver_wait

Подтверждение об отмене / удалить
  check_load             //android.widget.TextView[@text='Отменить текущую загрузку?']                //android.widget.TextView[@text='Удалить видео с устройства?']
  click id         com.ipspirates.ort:id/buttonDefaultPositive
  driver_wait

Кнопка запуска видео
  show_text_id                 com.ipspirates.ort:id/show_info_play_bt

Нажать на кнокпу запуска видео
  click_id                com.ipspirates.ort:id/show_info_play_bt
#####


### О приложении

Перейти по пункту меню "О приложении"
  click id                com.ipspirates.ort:id/nav_drawer_item_about

Проверить наличие элементов на странице
  show text              //android.widget.TextView[@text='О приложении']
  #scroll_to              com.ipspirates.ort:id/about_error_button
  show text id            com.ipspirates.ort:id/about_version_name
  show text               //android.widget.TextView[@text='Нашли ошибку?']
  show text               //android.widget.TextView[@text='СООБЩИТЬ ОБ ОШИБКЕ']
  show text               //android.widget.TextView[@text='Понравилось приложение?']
  andr_sc                 ОСТАВИТЬ ОТЗЫВ
  show text               //android.widget.Button[@text='ОСТАВИТЬ ОТЗЫВ']


Нажать на кнопку "Оставить отзыв"
  andr click             //android.widget.Button[@text='ОСТАВИТЬ ОТЗЫВ']

Открывается PlayMarket/AppleStore для оценки приложения
  #show text id             com.android.browser:id/url
  driver wait
  make_screen              PlayMarket.png



### Приложения первого канала
На вкладке меню перейти к блоку "Приложения первого канала"
  click id                com.ipspirates.ort:id/nav_fav_item_title
Нажать на любое приложение из списка
  #show text id             com.android.browser:id/url
  driver wait
  make_screen              AppFirstChannel.png

Напомнить о новостях
   show_text         //android.widget.TextView[@text='Напомнить о новостях']

Напомнить
  show_text            //android.widget.TextView[@text='Напомнить']
## Телепроекты

Напоминания
   show_text              //android.widget.LinearLayout[@index='0']
   show_text              //android.widget.LinearLayout[@index='1']
   show_text              //android.widget.LinearLayout[@index='2']
   show_text              //android.widget.LinearLayout[@index='3']



Телепроект
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects

Первый телепроект
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects


Перейти в разделы (гамбургер)
  andr_click                        //android.widget.ImageButton

Раздел (гамбургер) с телепроекта
  andr click             //android.view.ViewGroup/android.widget.ImageButton


Поиск
  click_id         com.ipspirates.ort:id/search_button

Закрыть поиск
  click_id         com.ipspirates.ort:id/show_case_close_button

Блок Избранное Телепроекты
  show_text_id             com.ipspirates.ort:id/nav_drawer_fav_teleprojects
  show text         //android.widget.TextView[@text='ИЗБРАННЫЕ ТЕЛЕПРОЕКТЫ']

Блок Приложения первого канала
  show text         //android.widget.TextView[@text='Приложения Первого канала']

Поиск по эпизодам
  click id              com.ipspirates.ort:id/action_episodes_search
  input                       com.ipspirates.ort:id/search_src_text              Ургант
  Перейти в раздел телепроекта



### Сохраненные ###

Сохраненные
  click_id         com.ipspirates.ort:id/nav_drawer_item_downloads
  show text                //android.widget.TextView[@text='Сохранённое']





Я вернулся назад
  andr click          //android.widget.ImageButton

Вернулся
  driver go back

Я добавил в избранное
  click_id         com.ipspirates.ort:id/item_teleprj_star

Реклама
  show text          //android.widget.TextView[@text='Реклама']

Пропустить
  andr click                       //android.widget.Button[@text='Пропустить']

Нажать паузу
  click_id      com.ipspirates.ort:id/pause_button
Нажать возпроизведение
  click_id        com.ipspirates.ort:id/play_button


Нажать на иконку меню в правом верхнем углу
  Перейти в разделы (гамбургер)

Проверить отображение меню с соответствующими пунктами (Телепрограмма, Прямой Эфир, Новости, Сохраненное, Телепроекты, О приложении)
  show text                  //android.widget.TextView[@text='Телепрограмма']
  show text                  //android.widget.TextView[@text='Прямой эфир']
  show text                  //android.widget.TextView[@text='Новости']
  show text                  //android.widget.TextView[@text='Сохранённое']
  show text                  //android.widget.TextView[@text='Телепроекты']
  show text                  //android.widget.TextView[@text='О приложении']


Перейти по пункту меню "Новости"
  Перейти в разделы (гамбургер)
Найти любую короткую новость (минута и меньше)
  Новости
  Первая новость
Я увидел текст - Реклама
  Реклама
  #click_id         com.ipspirates.ort:id/ad_seek_bar_panel

Просмотреть рекламу и нажать кнопку "Пропустить"
  Пропустить

В плеере нажать на видео прямой эфир
  click id                com.ipspirates.ort:id/live_stream_controls


В плеере нажать на видео еще раз
  click id             com.ipspirates.ort:id/vod_video_controls   #com.ipspirates.ort:id/video_panel

Повторно нажать на видео
  Нажать возпроизведение
Я увидел линию новости
  click id                com.ipspirates.ort:id/seek_bar

Я увидел начало время новости
  show text id           com.ipspirates.ort:id/time_text

Я увидел время в целом
  show text id           com.ipspirates.ort:id/duration_text

# На тайминге видео выбрать любое другое время (перемотать видео)
#  wait until page contains                00:
#

###










Я перешел по пункту меню "Телепроекты"
  Перейти в разделы (гамбургер)
Я нажал на любой телепроект из списка
  Первый телепроект
Я нажал на любое видео из ленты выбранного телепроекта
  Поиск
  input                        com.ipspirates.ort:id/search_src_text           Ургант
  click id           com.ipspirates.ort:id/item_teleprj_title
  Закрыть поиск

Я нажал на иконку "Воспроизведения"
  Первая новость


Я в плеере нажал на видео еще раз
  Нажать паузу
Я Повторно нажал на видео
  Нажать возпроизведение
  Вернулся
  Вернулся




На вкладке меню перейти к разделу "Телепроекты"
  Перейти в разделы (гамбургер)
  Телепроект
Перейти к любому телепроекту
  click id                 com.ipspirates.ort:id/item_teleprj_title

Перейти в раздел телепроекта
  click id                          com.ipspirates.ort:id/item_tele_episode_title

Увидел атрибуты
  show text id     com.ipspirates.ort:id/item_teleprj_title
  show text id     com.ipspirates.ort:id/item_teleprj_star


В выпадающем списке выбрать рубрику - Все видео
  click_id        com.ipspirates.ort:id/action_change_rubrics
  andr click           //android.widget.TextView[@text='Всё видео']
  show text               //android.widget.TextView[@text="Всё видео"]
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title

В выпадающем списке выбрать рубрику - Выпуски
  click_id        com.ipspirates.ort:id/action_change_rubrics
  andr click          //android.widget.TextView[@text='Выпуски']
  show text               //android.widget.TextView[@text="Выпуски"]
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title

В выпадающем списке выбрать рубрику - Монолог
  click_id        com.ipspirates.ort:id/action_change_rubrics
  andr click           //android.widget.TextView[@text='О проекте']
  show text               //android.widget.TextView[@text="О проекте"]
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title


#Wait Element And Click                [Arguments]                  ${locator}
#    Sleep                           1 sec
#    wait until page contains element          ${locator}           30 sec
#    click element                             ${locator}



###

У карточки телепроекта нажать на звездочку ("Добавить избранное")
  Я вернулся назад

Я проверил что телепроект добавился
  Перейти в разделы (гамбургер)
  Блок Избранное Телепроекты

###

На вкладке меню перейти к блоку "Избранные телепроекты"
  click_id         com.ipspirates.ort:id/nav_fav_item_title
Нажать на любой проект в блоке "Избранные телепроекты"
  show text                     //android.widget.TextView[@text="Всё видео"]
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_descr_lay


###

Вернулся к блоку Избранное
  Я вернулся назад
  Перейти в разделы (гамбургер)

Убрал телепроект из раздела избранных
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects
  Я добавил в избранное
  Перейти в разделы (гамбургер)
  Блок Приложения первого канала

###
Перейти по пункту меню "Новости" - будильник
   Новости
Нажать иконку будильника в правом верхнем углу
   Блок будильник
Проверить отображение выпадающего списка "Напомнить о новостях" с соответствующими атрибутами
   Напомнить о новостях
   Напоминания

Нажать на любое из время выпусков
  andr_click          //android.widget.LinearLayout[@index='1']
  #Напомнить
Проверить отображение выпадающего списка "Напомнить" с соответствующими атрибутами
  show_text        //android.widget.TextView[@text='За 5 минут']
  show_text       //android.widget.TextView[@text='За 15 минут']
  show_text       //android.widget.TextView[@text='За 30 минут']
  driver wait
  driver_go_back

###



###

Перейти по пункту меню "Телепроекты"
  Телепроект
Проверить наличие поля поиск при свайпе вниз
  andr_sc               Вечерний Ургант
  show text id             com.ipspirates.ort:id/toolbar
Проверить элементов на ленте, каждый элемент имеет соответствующие атрибуты
   Поделиться
   Полная дата добавления
   Тайтл
   Текст
   Скачать
   Кнопка запуска видео

Проверить наличие элементов на ленте, каждый элемент имеет соответствующие атрибуты
   Видео новости
   Описание новости
   Дата публикации

###

Нажать на любую из новостей
   Перейти детально к описанию
Проверить наличие элементов на экране выбранной новости, должны присутствовать следующие атрибуты
   Поделиться
   Полная дата добавления
   Тайтл
   Текст
   Скачать
   Кнопка запуска видео

###

На экране выбранной новости нажать на иконку "Воспроизведения"
   Нажать на кнокпу запуска видео



###

Перейти по пункту меню "Сохраненное"
  Сохраненные
  Видео новости


Проверить наличие элементов на ленте в блоке Сохраненное, каждый элемент имеет соответствующие атрибуты
  #Первая новость
  Видео новости
  click_id           com.ipspirates.ort:id/item_download_title


Проверить наличие элементов телепроекта в блоке Сохраненное, каждый элемент имеет соответствующие атрибуты
  Видео новости
  click_id           com.ipspirates.ort:id/item_download_title
### удаление сохраненной новости



#Видео успешно сохраняется в вкладку "Сохраненные" и скачивается на телефон
# Я вернулся назад в рубрики
# Перейти в разделы (гамбургер)
# Сохраненные
# Видео новости
# click_id           com.ipspirates.ort:id/item_download_title
#
#
#
Нет Сохраненных
   show text              //android.widget.TextView[@text='Сохраняйте видео в этот раздел, нажимая кнопку']


### Телепрограмма

Перейти по пункту меню "Телепрограмма"
  click id               com.ipspirates.ort:id/nav_drawer_item_schedule
Проверить отображение вкладок "Вчера, Сегодня, Завтра"
   show text            //android.widget.TextView[@text='ВЧЕРА']
   show text            //android.widget.TextView[@text='СЕГОДНЯ']
   show text            //android.widget.TextView[@text='ЗАВТРА']
Проверить элементов на ленте телепрограмы, каждый элемент имеет соответствующие атрибуты
   show text id           com.ipspirates.ort:id/item_telecast_title
   show text id           com.ipspirates.ort:id/item_play_click
   show text id           com.ipspirates.ort:id/item_telecast_time
   show text id           com.ipspirates.ort:id/item_telecast_root



### Пярмой эфир

Нажал на Прямой эфир
  click id           com.ipspirates.ort:id/nav_drawer_item_live_streaming

Проверка что перемотки нет
  element_does_not_contain           com.ipspirates.ort:id/ad_seek_bar_panel



### Поиск

Поиск многопоточный в телепроекте - Голос
  click id              com.ipspirates.ort:id/action_episodes_search
  search                com.ipspirates.ort:id/search_src_text          item           episod     name       title


Поиск многопоточный в телепроекте - 22.11.17
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search
  search                com.ipspirates.ort:id/search_src_text          item2           episod2     name2       title2

Поиск многопоточный в телепроекте - Владимир Познер
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search
  search                com.ipspirates.ort:id/search_src_text          item3           episod3     name3       title3

Поиск многопоточный в телепроекте - 899 выпуск
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search
  search                com.ipspirates.ort:id/search_src_text          item4           episod4     name4       title4

Поиск многопоточный в телепроекте - Новости от Ивана
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search
  search                com.ipspirates.ort:id/search_src_text          item5           episod5     name5       title5
  clear_field           com.ipspirates.ort:id/action_episodes_search


Приложение закрылось
  driver quite

Отчистил поиск
  click_id           com.ipspirates.ort:id/search_close_btn



### Стресс тестирование


Приложение свернули и развернули 100 раз
  background
