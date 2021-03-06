# !/bin/bash

# Написать скрипт, которой получает путь и размер в качестве
# аргументов и определяет, не превосходит ли размер 
# файла/директории заданное в параметрах значение (предусмотреть
# контроль ошибок с выводом сообщения stderr).

# !!! Размер должен задаваться в килобайтах.

parameter_count=$#
if [[ $parameter_count = 2 ]]; then
  script_name=$0
  object=$1
  size=$2

  if [[ -e $object ]]; then
    echo "Указанный файл (директория): $object"
  else 
    echo "Ошибка: Указанный файл (директория) не существует.">&2
    exit
  fi

  unsigned_integer='^[0-9]+$'
  if [[ $size =~ $unsigned_integer ]]; then
    echo "Указанный размер файла (директории): $size"
  else 
    echo "Ошибка: Размер должен быть беззнаковым целым числом.">&2
    exit
  fi

  real_size=$(du -sh -k $object | awk '{print $1}')
  echo "Реальный размер файла (директории): $real_size"

  if [ $real_size -gt $size ]; then
    echo "Реальный размер файла (директории) превосходит указанный."
  else
    if [ $real_size -eq $size ]; then
      echo "Реальный и указанный размеры совпадают."
    else
      echo "Реальный размер файла (директории) меньше указанного."
    fi
  fi
else
  echo "Ошибка: Неверное число параметров." >&2
  exit
fi