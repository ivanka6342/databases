SET NAMES utf8;
USE dormitory_db;

SELECT DISTINCT
    TT.student
FROM (
    SELECT
        CONCAT(student_t.second_name, ' ', student_t.first_name) AS 'student',
        job_t.dorm_num AS 'dormitory'
    FROM student_t
    INNER JOIN journal_entry_t
        ON journal_entry_t.student_card = student_t.student_card_num
    INNER JOIN job_t
        ON job_t.id = journal_entry_t.job_id
    GROUP BY student, dormitory
) AS TT
GROUP BY TT.student HAVING COUNT(TT.dormitory) = 1;
