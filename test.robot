*** Settings ***
Resource          browserstack_resoure.robot
Force Tags         BrowserStack




*** Test Cases ***
#
7782 - Прямой эфир. Проигрывание рекламы
    Given Перейти в разделы (гамбургер)
    And Нажал на Прямой эфир
    Then Реклама
    And Пропустить

7781 - Прямой эфир. Воспроизведение/Пауза
    Given В плеере нажать на видео прямой эфир
    And Нажать паузу
    And Нажать возпроизведение


#7783 - Прямой эфир. Проверка отображения прямого эфира в полный экран
#    Given
#    Then

7784 - Прямой эфир. Проверка отсутствия возможности перемотки
    Then Проверка что перемотки нет