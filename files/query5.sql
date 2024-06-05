SET NAMES utf8;
USE dormitory_db;

SET @s_date := '2020-07-01';

SELECT
    r.floor_num AS 'floor',
    COUNT(*) AS 'now live'
FROM student_t AS stud
    INNER JOIN accomodation_contract_t AS contr
        ON stud.student_card_num = contr.student_card
    INNER JOIN room_t AS r
        ON r.room_num = contr.room_num
WHERE contr.ac_date = @s_date
GROUP BY floor;
