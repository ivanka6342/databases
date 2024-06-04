SET NAMES utf8;
USE dormitory_db;

SELECT DISTINCT
    CONCAT(student_t.second_name, ' ', student_t.first_name) AS 'student',
    CONCAT(floor_mentor_t.second_name, ' ', floor_mentor_t.first_name) AS 'mentor'
FROM student_t
INNER JOIN journal_entry_t
    ON journal_entry_t.student_card = student_t.student_card_num
INNER JOIN job_t
    ON job_t.id = journal_entry_t.job_id
INNER JOIN floor_mentor_t
    ON floor_mentor_t.contract_num = job_t.floor_mentor
ORDER BY student ASC;
