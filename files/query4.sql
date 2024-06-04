SET NAMES utf8;
USE dormitory_db;

SELECT
    journal_entry_t.je_date AS 'дата',
    CONCAT(student_t.second_name, ' ', student_t.first_name) AS 'студент',
    CONCAT(floor_mentor_t.second_name, ' ', floor_mentor_t.first_name) AS 'воспитатель',
    job_t.hour_count AS 'отработанное время'
FROM student_t
INNER JOIN journal_entry_t
    ON journal_entry_t.student_card = student_t.student_card_num
INNER JOIN job_t
    ON job_t.id = journal_entry_t.job_id
INNER JOIN floor_mentor_t
    ON floor_mentor_t.contract_num = job_t.floor_mentor
ORDER BY journal_entry_t.je_date ASC;
