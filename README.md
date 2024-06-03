### ER diagram

Topic: Общежитие

Определение связей:

> типы связей:  
> 11 - один-к-одному  
> 1* - один-ко-многим  
> *1 - многие-к-одному  
> ** - многие-ко-многим  

1* | 1) общежитие – комната : включение  
1* | 2) общежитие – отработка : объем работы  
** | 3) студент – отработка : необх. выполнить объем работы(время) – доп табл. «запись в журнале»  
** | 4) студент – комната : вспом. таблица «договор о проживании»  
1* | 5) комната – воспитатель : обл. влияния  
1* | 6) общежитие – воспитатель : сотрудники  
11 | 7) студент – пропуск : владение  
1* | 8) пропуск – общежитие : выдача и учет пропусков  
1* | 9) воспитатель – отработка : руководитель труда  

![ER diagram](https://github.com/ivanka6342/databases/blob/main/images/ER-diagram.jpg)


### Convert an ER diagram to the Relational Data Model (Реляционная схема данных) - UML-diagram

![Relational Schema](https://github.com/ivanka6342/databases/blob/main/images/ER-data-model.jpg)


### create DB

![create db](https://github.com/ivanka6342/databases/blob/main/images/create-db-out.png)
