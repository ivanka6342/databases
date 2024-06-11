### Run project

\# git clone \<this repo\>  
\# cd \<project directory\>  
\# docker-compose up -d  
Open **phpmyadmin** in web-browser (**localhost:8081**) and log in as root:rootpass  

Now you are ready to run queries one-by-one. You can do it in 3 ways:  
1. Do everything in browser  
Open **phpmyadmin** in web-browser as described above  
Copy query code from <this repo/files/> dir and manually and insert into phpmyadmin console  
2. Enter mysql container & do everything in it  
Stay in the terminal  
\# ./run-queries.sh --copy-only  
copy mysql container ID  
Enter docker container  
\# docker exec -ti <mysql container ID> bash  
\# cd /root/files  
\# mysql -u root  
mysql\> source <sql-query name>  
3. Run in terminal (without enter to container); see results in browser  
Open **phpmyadmin** in web-browser as described above  
Return to the terminal and run the queries one-by-one  
\# ./run-queries.sh --run-query "1-create-db.sql"  
check tables in phpmyadmin again  


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


### Convert an ER diagram to the Relational Data Model
Реляционная схема данных - UML-diagram  

![Relational Schema](https://github.com/ivanka6342/databases/blob/main/images/ER-data-model.jpg)


### Create DB and tables

![create db](https://github.com/ivanka6342/databases/blob/main/images/create-db-out.png)

![create tables](https://github.com/ivanka6342/databases/blob/main/images/create-tables-out.png)


### Fill tables

![fill table 1](https://github.com/ivanka6342/databases/blob/main/images/fill-table-1.png)
![fill table 2](https://github.com/ivanka6342/databases/blob/main/images/fill-table-2.png)
![fill table 3](https://github.com/ivanka6342/databases/blob/main/images/fill-table-3.png)


### Query tasks - lab 4

Lab 4 implementation rules:  
* only one SELECT operator: no sub-queries, no grouping  
* choose correct JOIN type according task  

*ЗАДАНИЕ 1*  
вывести инфо о студентах, которые в заданную дату жили в указанной комнате общ.  
формат вывода:  
| общага, комната | срок проживания | № студ.билета | ФИО | курс, группа |  
\+ сортировка по номеру комнаты  

![query 1](https://github.com/ivanka6342/databases/blob/main/images/query1.jpg)

*ЗАДАНИЕ 2*  
вывести комбинации ФИО воспитателя + ФИО студента  
через отработки (кто с кем работал), без дубликатов - по факту их взаимодействия  
формат вывода:  
| студент | воспитатель |  
\+ сортировка по студентам

![query 2](https://github.com/ivanka6342/databases/blob/main/images/query2.png)

*ЗАДАНИЕ 3*  
вывести все общежития, в которых хоть раз проживал студент N-курса без дублирующейся инфо

![query 3](https://github.com/ivanka6342/databases/blob/main/images/query3.png)

*ЗАДАНИЕ 4*  
график инфо об отработках: кто из студентов с кем работал  
\+ сортировка по дате отработок

![query 4](https://github.com/ivanka6342/databases/blob/main/images/query4.png)

### laba 5

*ЗАДАНИЕ 5*  
для каждого этажа указать, сколько проживает студентов на определенную дату  

*ЗАДАНИЕ 6*  
поиск (рейтинг) студентов по набранному количеству взаимодействий с воспитателями (проживание + отработки)  

![query 5,6](https://github.com/ivanka6342/databases/blob/main/images/query56.png)

*ЗАДАНИЕ 7*  
поиск студентов, все отработки которых были только в одном общежитии  

*ЗАДАНИЕ 8*  
поиск комнаты в конкретном общежитии, в которой не жили студенты с шаблонной фамилией  

![query 7,8](https://github.com/ivanka6342/databases/blob/main/images/query78.png)

*ЗАДАНИЕ 9*  
добавить таблицу «ремонт»  
связь с таблицей комната в отношении "один ко многим" (одна комната может ремонтироваться много раз)  
ремонт занимает некоторый период  
по началу ремонта, переместить студентов в другую комнату (оформить новый контракт, а старый признать недействительным), для этого написать триггер добавить в таблицу accomodation_contract_t поле действительности ли контракт  

![query 9](https://github.com/ivanka6342/databases/blob/main/images/query9.png)
