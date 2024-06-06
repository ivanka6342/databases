SET NAMES utf8;
USE dormitory_db;

SET @s_dorm := 2;

SELECT
    room_t.room_num
FROM room_t
WHERE room_t.dorm_num = @s_dorm
AND room_t.room_num 
NOT IN (
    SELECT
        room_t.room_num
    FROM student_t
    INNER JOIN accomodation_contract_t
        ON student_t.student_card_num = accomodation_contract_t.student_card
    INNER JOIN room_t
        ON room_t.room_num = accomodation_contract_t.room_num
    WHERE room_t.dorm_num = @s_dorm
        AND student_t.second_name LIKE '%ен'
    GROUP BY room_t.room_num
)
