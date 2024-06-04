SET NAMES utf8;
USE dormitory_db;

SET @s_course := 4;

SELECT DISTINCT
    room_t.dorm_num AS 'общежитие',
    CONCAT(student_t.second_name, ' ', student_t.first_name) AS 'студент'
FROM accomodation_contract_t
INNER JOIN room_t
    ON accomodation_contract_t.room_num = room_t.room_num
INNER JOIN student_t
    ON accomodation_contract_t.student_card = student_t.student_card_num
WHERE student_t.course = @s_course;
