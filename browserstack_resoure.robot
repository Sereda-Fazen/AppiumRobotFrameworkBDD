*** Settings ***
Library           AppiumLibrary    timeout=50   run_on_failure=No Operation
Library           Browserstack.py       ${BUILD}        ${DEVICE}
#Library            keywords.py
#Library           plugins.py
*** Variables ***
${REMOTE_URL}     http://0.0.0.0:4723/wd/hub

*** Keywords ***


Новости
  click_id         com.ipspirates.ort:id/nav_drawer_item_news              Новости

Первая новость
  click_id         com.ipspirates.ort:id/item_play_click                   Первая_новость

Видео новости
  show_text_id         com.ipspirates.ort:id/item_play_click              Видео_новости

Описание новости
  show_text_id         com.ipspirates.ort:id/item_news_descr              Описание_новости
Дата публикации
  show_text_id         com.ipspirates.ort:id/item_news_title              Дата_публикации


Перейти детально к описанию
  click_id        com.ipspirates.ort:id/item_news_descr_lay               Описание_новости


Блок будильник
  click_id         com.ipspirates.ort:id/action_notify_news               Будильник

##### Детально для всех разделов   ##################

Поделиться
  show_text_id                 com.ipspirates.ort:id/action_share_show          Поделиться
Полная дата добавления
  show_text_id                 com.ipspirates.ort:id/show_info_date_text         Полная_дата
Тайтл
  show_text_id                 com.ipspirates.ort:id/show_info_title_text        Тайтл
Текст
  show_text_id                 com.ipspirates.ort:id/show_info_descr_text         Текст

Скачать
  show_text_id                 com.ipspirates.ort:id/show_info_download_bt         Скачать

Нажать на кнопку сохранить
  click_id                 com.ipspirates.ort:id/show_info_download_bt              Сохранить

Подтверждение об сохранении
  show text             //android.widget.TextView[@text='Сохранить видео на устройство?']          Сохранить_видео_на_устройство
  click id        com.ipspirates.ort:id/buttonDefaultPositive             Сохранить?
  driver_wait

Подтверждение об удалении
  check_load             //android.widget.TextView[@text='Отменить текущую загрузку?']                //android.widget.TextView[@text='Удалить видео с устройства?']
  click id         com.ipspirates.ort:id/buttonDefaultPositive          Удалить?
  driver_wait

Подтверждение об отмене / удалить
  check_load             //android.widget.TextView[@text='Отменить текущую загрузку?']                //android.widget.TextView[@text='Удалить видео с устройства?']
  click id         com.ipspirates.ort:id/buttonDefaultPositive          Отменить?
  driver_wait

Кнопка запуска видео
  show_text_id                 com.ipspirates.ort:id/show_info_play_bt             Кнопка_запуска_видео

Нажать на кнокпу запуска видео
  click_id                com.ipspirates.ort:id/show_info_play_bt            Запуск_видео
#####


### О приложении

Перейти по пункту меню "Поддержка"
  click id               com.ipspirates.ort:id/nav_drawer_item_about        Поддержка

Проверить наличие элементов на странице
  show text              //android.widget.TextView[@text='Поддержка']       Проверить_наличие_элементов
  #scroll_to              com.ipspirates.ort:id/about_error_button
  show text               //android.widget.TextView[@text='Проблема']       Проверить_наличие_элементов
  show text               //android.widget.TextView[@text='Улучшение']      Проверить_наличие_элементов
  show text               //android.widget.TextView[@text='Другое']         Проверить_наличие_элементов
  show text               //android.widget.Button[@text='Оценить наше приложение']        Проверить_наличие_элементов




Нажать на кнопку "Оценить наше приложение"
  andr click             //android.widget.Button[@text='Оценить наше приложение']        Оценить_наше_приложение

Открывается PlayMarket/AppleStore для оценки приложения
  #show text id             com.android.browser:id/url
  driver wait
  make_screen              PlayMarket.png



### Приложения первого канала
На вкладке меню перейти к блоку "Приложения первого канала"
  click id                com.ipspirates.ort:id/nav_fav_item_title             Приложения
Нажать на любое приложение из списка
  #show text id             com.android.browser:id/url
  driver wait
  make_screen              AppFirstChannel.png

Напомнить о новостях
   show_text         //android.widget.TextView[@text='Напомнить о новостях']            Напомнить_о_новостях

Напомнить
  show_text            //android.widget.TextView[@text='Напомнить']             Напомнить
## Телепроекты

Напоминания
   show_text              //android.widget.LinearLayout[@index='0']           Время
   show_text              //android.widget.LinearLayout[@index='1']           Время
   show_text              //android.widget.LinearLayout[@index='2']           Время
   show_text              //android.widget.LinearLayout[@index='3']           Время



Телепроект
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects          Телепроект

Первый телепроект
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects          Первый_телепроект


Перейти в разделы (гамбургер)
  andr_click                        //android.widget.ImageButton        гамбургер

Раздел (гамбургер) с телепроекта
  andr click             //android.view.ViewGroup/android.widget.ImageButton         Раздел_гамбургер_с_телепроекта


Поиск
  click_id         com.ipspirates.ort:id/search_button                 Поиск

Закрыть поиск
  click_id         com.ipspirates.ort:id/show_case_close_button         Закрыть_поиск

Блок Избранное Телепроекты
  show_text_id             com.ipspirates.ort:id/nav_drawer_fav_teleprojects            Избранные
  show text         //android.widget.TextView[@text='ИЗБРАННЫЕ ТЕЛЕПРОЕКТЫ']            Избранные_телепроекты

Блок Приложения первого канала
  show text         //android.widget.TextView[@text='Приложения Первого канала']        Приложения_первого_канала

Поиск по эпизодам
  click id              com.ipspirates.ort:id/action_episodes_search             Поиск_эпизоды
  input                       com.ipspirates.ort:id/search_src_text              Ургант
  Перейти в раздел телепроекта

Поиск невалидный
  click id              com.ipspirates.ort:id/action_episodes_search             Поиск_эпизоды
  input                       com.ipspirates.ort:id/search_src_text              "№;%:?*(
  show text                 //android.widget.TextView[@text='Поиск не дал результатов']          Поиск_невалидный

### Сохраненные ###

Сохраненные
  click_id         com.ipspirates.ort:id/nav_drawer_item_downloads               Сохраненные
  show text                //android.widget.TextView[@text='Сохранённое']                        Сохранённое





Я вернулся назад
  andr click          //android.widget.ImageButton               Назад

Вернулся
  driver go back

Я добавил в избранное
  click_id         com.ipspirates.ort:id/item_teleprj_star              Добавить_в_избранное

Реклама
  show text          //android.widget.TextView[@text='Реклама']                       Реклама

Реклама отсутствует
  element_does_not_contain_xpath            //android.widget.TextView[@text='Реклама']                       Реклама

Пропустить
  andr click                       //android.widget.Button[@text='Пропустить']             Пропустить

Нажать паузу
  click_id      com.ipspirates.ort:id/pause_button                 Пауза
Нажать возпроизведение
  click_id        com.ipspirates.ort:id/play_button                Плей




Проверить отображение меню с соответствующими пунктами (Телепрограмма, Прямой Эфир, Новости, Сохраненное, Телепроекты, О приложении)
  show text                  //android.widget.TextView[@text='Телепрограмма']         Проверить_отображение_меню
  show text                  //android.widget.TextView[@text='Прямой эфир']           Проверить_отображение_меню
  show text                  //android.widget.TextView[@text='Новости']               Проверить_отображение_меню
  show text                  //android.widget.TextView[@text='Сохранённое']           Проверить_отображение_меню
  show text                  //android.widget.TextView[@text='Телепроекты']           Проверить_отображение_меню
  show text                  //android.widget.TextView[@text='Поддержка']          Проверить_отображение_меню


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
  click id                com.ipspirates.ort:id/live_stream_controls             Видео_прямой_эфир


В плеере нажать на видео еще раз
  click id             com.ipspirates.ort:id/vod_video_controls      Клик_видео

Повторно нажать на видео
  Нажать возпроизведение
Я увидел линию новости
  click id                com.ipspirates.ort:id/seek_bar               Линия_новости

Я увидел начало время новости
  show text id           com.ipspirates.ort:id/time_text          Время_новости

Я увидел время в целом
  show text id           com.ipspirates.ort:id/duration_text         Общее_время

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
  click id           com.ipspirates.ort:id/item_teleprj_title                  Тайтл_телепроекта
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
  click id                 com.ipspirates.ort:id/item_teleprj_title            Тайтл_телепроекта

Перейти в раздел телепроекта
  click id                          com.ipspirates.ort:id/item_tele_episode_title         Тайтл_эпизода_телепроекта

Увидел атрибуты
  show text id     com.ipspirates.ort:id/item_teleprj_title         Тайтл_проекта
  show text id     com.ipspirates.ort:id/item_teleprj_star          Телепроект_Избранное


В выпадающем списке выбрать рубрику - Все видео
  click_id        com.ipspirates.ort:id/action_change_rubrics                  Клик_рубрики
  andr click           //android.widget.TextView[@text='Всё видео']                 Рубрики
  show text               //android.widget.TextView[@text="Всё видео"]               Рубрики
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title        Епизод

#В выпадающем списке выбрать рубрику - Выпуски
#  click_id        com.ipspirates.ort:id/action_change_rubrics
#  andr click          //android.widget.TextView[@text='Выпуски']
#  show text               //android.widget.TextView[@text="Выпуски"]
#  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title
#
#В выпадающем списке выбрать рубрику - Монолог
#  click_id        com.ipspirates.ort:id/action_change_rubrics
#  andr click           //android.widget.TextView[@text='О проекте']
#  show text               //android.widget.TextView[@text="О проекте"]
#  show_text_id                  com.ipspirates.ort:id/item_tele_episode_title


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
  click_id         com.ipspirates.ort:id/nav_fav_item_title                  Избранные_телепроекты
Нажать на любой проект в блоке "Избранные телепроекты"
  show text                     //android.widget.TextView[@text="Всё видео"]              Все_видео
  show_text_id                  com.ipspirates.ort:id/item_tele_episode_descr_lay         Проект_избранное


###

Вернулся к блоку Избранное
  Я вернулся назад
  Перейти в разделы (гамбургер)

Убрал телепроект из раздела избранных
  click_id         com.ipspirates.ort:id/nav_drawer_item_teleprojects             Избранные_в_телепроекте
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
  andr_click          //android.widget.LinearLayout[@index='1']           Время_выпуска
  #Напомнить
Проверить отображение выпадающего списка "Напомнить" с соответствующими атрибутами
  show_text        //android.widget.TextView[@text='За 5 минут']            5минут
  show_text       //android.widget.TextView[@text='За 15 минут']            15минут
  show_text       //android.widget.TextView[@text='За 30 минут']            30минут
  driver wait
  driver_go_back

###



###

Перейти по пункту меню "Телепроекты"
  Телепроект
Проверить наличие поля поиск при свайпе вниз
  andr_sc               Вечерний Ургант
  show text id             com.ipspirates.ort:id/toolbar              Поиск_при_скролле
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
  click_id           com.ipspirates.ort:id/item_download_title            Тайтл_новости


Проверить наличие элементов телепроекта в блоке Сохраненное, каждый элемент имеет соответствующие атрибуты
  Видео новости
  click_id           com.ipspirates.ort:id/item_download_title             Тайтл_телепроекта
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
   show text              //android.widget.TextView[@text='Сохраняйте видео в этот раздел, нажимая кнопку']          Нет_Сохраненных


### Телепрограмма

Перейти по пункту меню "Телепрограмма"
  click id               com.ipspirates.ort:id/nav_drawer_item_schedule           Телепрограмма
Проверить отображение вкладок "Вчера, Сегодня, Завтра"
   show text            //android.widget.TextView[@text='ВЧЕРА']              Вчера
   show text            //android.widget.TextView[@text='СЕГОДНЯ']            Сегодня
   show text            //android.widget.TextView[@text='ЗАВТРА']             Завтра
Проверить элементов на ленте телепрограмы, каждый элемент имеет соответствующие атрибуты
   show text id           com.ipspirates.ort:id/item_telecast_title       Тайтл_программы
   show text id           com.ipspirates.ort:id/item_play_click           Кнопка_запуска_видео
   show text id           com.ipspirates.ort:id/item_telecast_time        Время_телепроекта
   show text id           com.ipspirates.ort:id/item_telecast_root        Телепроект_описание



### Пярмой эфир

Нажал на Прямой эфир
  click id           com.ipspirates.ort:id/nav_drawer_item_live_streaming             Прямой эфир

Проверка что перемотки нет
  element_does_not_contain           com.ipspirates.ort:id/ad_seek_bar_panel



### Поиск
Поиск запроса "до"
  click id              com.ipspirates.ort:id/search_button             Поиск_эпизоды
  input                       com.ipspirates.ort:id/search_src_text              До

Вижу передачу - Доброе утро
  show text              //android.widget.TextView[@text='Доброе утро']         Доброе утро

Вижу передачу - Дорогая переДача
  show text              //android.widget.TextView[@text='Дорогая переДача']    Дорогая переДача
Вижу передачу - Жить здорово!
  show text              //android.widget.TextView[@text='Жить здорово!']       Жить здорово!
Вижу передачу - Здоровье
  show text              //android.widget.TextView[@text='Здоровье']            Здоровье



Поиск многопоточный в телепроекте - Голос
  click id              com.ipspirates.ort:id/action_episodes_search         Поиск
  search                com.ipspirates.ort:id/search_src_text          item           episod     name       title


Поиск многопоточный в телепроекте - 22.11.17
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search      Поиск
  search                com.ipspirates.ort:id/search_src_text          item2           episod2     name2       title2

Поиск многопоточный в телепроекте - Владимир Познер
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search      Поиск
  search                com.ipspirates.ort:id/search_src_text          item3           episod3     name3       title3

Поиск многопоточный в телепроекте - 899 выпуск
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search       Поиск
  search                com.ipspirates.ort:id/search_src_text          item4           episod4     name4       title4

Поиск многопоточный в телепроекте - Новости от Ивана
  clear_field           com.ipspirates.ort:id/action_episodes_search
  click id              com.ipspirates.ort:id/action_episodes_search      Поиск
  search                com.ipspirates.ort:id/search_src_text          item5           episod5     name5       title5
  clear_field           com.ipspirates.ort:id/action_episodes_search


Приложение закрылось
  driver quite

Отчистил поиск
  click_id           com.ipspirates.ort:id/search_close_btn           Отчистить_поиск



### Стресс тестирование


Приложение свернули и развернули 100 раз
  background
