SET NAMES utf8;
USE dormitory_db;

SELECT
    T1.group, T1.student, COUNT(*) AS 'stat'
FROM (
    (
    SELECT
        st1.stud_group AS 'group',
        CONCAT(st1.second_name, ' ', st1.first_name) AS 'student'
        FROM student_t AS st1
            INNER JOIN accomodation_contract_t AS contr1
                ON st1.student_card_num = contr1.student_card
    )
    UNION ALL
    (
        SELECT
            st2.stud_group AS 'group2',
            CONCAT(st2.second_name, ' ', st2.first_name) AS 'student2'
        FROM student_t AS st2
            INNER JOIN journal_entry_t AS contr2
                ON st2.student_card_num = contr2.student_card
    )
) AS T1
GROUP BY T1.group, T1.student
ORDER BY stat DESC;