*** Settings ***
Resource          browserstack_resoure.robot
Force Tags         BrowserStack




*** Test Cases ***
#
7786 - Проверка отображение Меню
  Given Нажать на иконку меню в правом верхнем углу
    Then Проверить отображение меню с соответствующими пунктами (Телепрограмма, Прямой Эфир, Новости, Сохраненное, Телепроекты, О приложении)


7809 - Проверка отображения элементов на экране "О приложении"
   Given Перейти по пункту меню "О приложении"
   Then Проверить наличие элементов на странице

7811 - Проверка работы функции "Оставить отзыв"
  Given Нажать на кнопку "Оставить отзыв"
  Then Открывается PlayMarket/AppleStore для оценки приложения
  And Вернулся

8040 - Проверить переход на страницы приложений первого канала в PlayMarket
  Given Перейти в разделы (гамбургер)
  When На вкладке меню перейти к блоку "Приложения первого канала"
  Then Нажать на любое приложение из списка
  And Вернулся

7895 - Проверить просмотр и воспроизведение коротких новостей
   Given Перейти в разделы (гамбургер)
   When Найти любую короткую новость (минута и меньше)
   And Реклама
   Then Пропустить

#
7814 - Проверить паузу,остановку и перемотку видео на экране "Новости"
   Given В плеере нажать на видео еще раз
   And Я увидел линию новости
   And Я увидел начало время новости
   And Я увидел время в целом
   #Then Нажать паузу

   #And На тайминге видео выбрать любое другое время (перемотать видео)



7813 - Проверить паузу,остановку и перемотку видео на экране "Телепроекта"

  Given Вернулся
  And Я перешел по пункту меню "Телепроекты"
   And Я нажал на любой телепроект из списка
   And Я нажал на любое видео из ленты выбранного телепроекта

7808 - Проверка работы поиска на экране выбранного "Телепроекта"
  Given Поиск по эпизодам
  And Вернулся
  And Вернулся
  And Вернулся


8041 - Проверить выбор рубрики на странице телепроекта
  Given В выпадающем списке выбрать рубрику - Все видео
#  Then В выпадающем списке выбрать рубрику - Выпуски
#  Then В выпадающем списке выбрать рубрику - Монолог


8038 - Проверить добавление проекта в избранное
  Given Вернулся
  And Отчистил поиск
  When Я добавил в избранное
  Then Я проверил что телепроект добавился

8039 - Проверить переход из избранного на страницу телепроекта
  Given На вкладке меню перейти к блоку "Избранные телепроекты"
  And Нажать на любой проект в блоке "Избранные телепроекты"

Проверить телепроект который был удален из раздела избранных
  Given Вернулся к блоку Избранное
  Then Убрал телепроект из раздела избранных


7800 - 7801 - Проверить наличие элементов на экране "Телепроекты"
  Given Перейти в разделы (гамбургер)
  And Перейти по пункту меню "Телепроекты"
  When Проверить наличие поля поиск при свайпе вниз
  Then Увидел атрибуты

7802 - 7788 - Проверить наличие элементов на экране выбранного видео из "Телепроекта"
  And Перейти к любому телепроекту
  And Перейти в раздел телепроекта
  Then Проверить элементов на ленте, каждый элемент имеет соответствующие атрибуты

7804 - Проверить сохранение видео из выбранного телепроекта
  Given Нажать на кнопку сохранить
  When Подтверждение об сохранении
  And Вернулся
  And Перейти в разделы (гамбургер)
  And Перейти в разделы (гамбургер)
  And Перейти по пункту меню "Сохраненное"
  Then Проверить наличие элементов телепроекта в блоке Сохраненное, каждый элемент имеет соответствующие атрибуты

7791 - Проверить сохранение выбранной "Телепрограммы"
  Given Нажать на кнопку сохранить
  And Подтверждение об отмене / удалить
  And Вернулся
  Then Нет Сохраненных

7792 - Проверить наличие элементов в выпадающем списке "Напомнить о новостях"
  Given Вернулся
  When Перейти в разделы (гамбургер)
  And Перейти по пункту меню "Новости" - будильник
  And Нажать иконку будильника в правом верхнем углу
  Given Проверить отображение выпадающего списка "Напомнить о новостях" с соответствующими атрибутами
  And Нажать на любое из время выпусков
  Then Проверить отображение выпадающего списка "Напомнить" с соответствующими атрибутами

7793 - Проверить наличие элементов на экране "Новости"
  Given Проверить наличие элементов на ленте, каждый элемент имеет соответствующие атрибуты

7794 - Проверить наличие элементов на экране выбранной "Новости"
  Given Нажать на любую из новостей
  Then Проверить наличие элементов на экране выбранной новости, должны присутствовать следующие атрибуты
#
7795 - Проверить воспроизведение выбранной "Новости
  Given На экране выбранной новости нажать на иконку "Воспроизведения"
  Then Реклама
  Then Пропустить
  Given Нажать паузу
  And Нажать возпроизведение

7797 - Проверить сохранение выбранной "Новости"
  Given Вернулся
  Given Нажать на кнопку сохранить
  Then Подтверждение об сохранении
#
7798 - Проверить наличие элементов на экране "Сохраненное"
  Given Вернулся
  And Перейти в разделы (гамбургер)
  And Перейти по пункту меню "Сохраненное"
  Then Проверить наличие элементов на ленте в блоке Сохраненное, каждый элемент имеет соответствующие атрибуты

7799 - 7812 - Проверить воспроизведение видео на экране "Сохраненные"
   Given Нажать на кнокпу запуска видео
   Then Реклама
   Then Пропустить
   Given В плеере нажать на видео еще раз
   And Я увидел линию новости

#
Удаление сохраненной новости
   Given Вернулся
   And Нажать на кнопку сохранить
   Then Подтверждение об удалении
   And Вернулся
   Then Нет Сохраненных

7787 - Проверка наличия элементов на экране "Телепрограмма"
   Given Перейти в разделы (гамбургер)
    And Перейти по пункту меню "Телепрограмма"
    And Проверить отображение вкладок "Вчера, Сегодня, Завтра"
    Then Проверить элементов на ленте телепрограмы, каждый элемент имеет соответствующие атрибуты


7782 - Прямой эфир. Проигрывание рекламы
    Given Перейти в разделы (гамбургер)
    And Нажал на Прямой эфир
    Then Реклама
    #And Пропустить

7781 - Прямой эфир. Воспроизведение/Пауза
    Given В плеере нажать на видео прямой эфир
    And Нажать возпроизведение
    And Нажать паузу

#7783 - Прямой эфир. Проверка отображения прямого эфира в полный экран
#    Given
#    Then

7784 - Прямой эфир. Проверка отсутствия возможности перемотки
    Then Проверка что перемотки нет

Приложение закрыть
   Given Вернулся
   Then Приложение закрылось
#
#
#
#






















#8040 - Проверить переход на страницы приложений первого канала в PlayMarket
#  Given На вкладке меню перейти к блоку "Приложения первого канала"
#  And Нажать на любое приложение из списка
#  Then Открывается страница в PlayMarket для установки выбранного МП