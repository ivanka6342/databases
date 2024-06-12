# MySQL data dump и использование скриптов:
# бекап одной базы данных в файл dump_file.sql
mysqldump -uroot -p your_base > dump_file.sql

# бекап только отдельных таблиц, а не всей базы данных
mysqldump -uroot -p your_base TABLE1 TABLE2 TABLE3 > dump_file.sql

# бекап только структуры базы данных без самих данных
mysqldump -uroot -p --no-data your_base > dump_file.sql

# запуск скриптов в консольном клиенте
source script.sql;
