SET NAMES utf8;
USE dormitory_db;

SET @s_date := '2020-07-01';
SET @s_room := '811b-1';

SELECT
    room_t.dorm_num AS 'общежитие',
    room_t.room_num AS 'комната',
    accomodation_contract_t.ac_date AS 'срок проживания',
    student_t.student_card_num AS 'студ.билет',
    CONCAT(student_t.second_name, ' ', student_t.first_name) AS 'студент',
    CONCAT(student_t.stud_group, ' (', student_t.course, ')') AS 'группа(курс)'
FROM accomodation_contract_t
INNER JOIN student_t
    ON accomodation_contract_t.student_card = student_t.student_card_num
INNER JOIN room_t
    ON accomodation_contract_t.room_num = room_t.room_num
WHERE room_t.room_num = @s_room AND accomodation_contract_t.ac_date = @s_date
ORDER BY room_t.room_num ASC;