@echo off

:: Установка кодировки UTF-8
chcp 65001

:: Добавление указанного в параметрах пути в переменную
:: окружения PATH
SET path=D:\TestFolder;%path%

:: Вывод пути доступа на экран
SET path

exit