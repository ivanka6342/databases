SET NAMES utf8;
USE dormitory_db;

/* 1) add table 'repair' */
DROP TABLE IF EXISTS repair_t;

CREATE TABLE repair_t (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    room_num VARCHAR(255) NOT NULL,
    repair_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (room_num) REFERENCES room_t (room_num)
);

/* 2) add check if accomodation contract is active or expired */
ALTER TABLE `accomodation_contract_t`
    ADD COLUMN `is_active` BOOLEAN NOT NULL DEFAULT true;

SELECT *
FROM accomodation_contract_t;

/* 3) add trigger which activates when room repair started */
DELIMITER $$
CREATE TRIGGER start_repair BEFORE INSERT ON repair_t
FOR EACH ROW BEGIN
/* нашли контракты проживания, которые надо разорвать */

/* rooms */
SET @T_room := (
    SELECT ac.room_num
    FROM accomodation_contract_t AS ac
    WHERE ac.room_num = NEW.room_num AND ac.ac_date = NEW.repair_date
);

/* contract num */
SET @T_ac := (
    SELECT ac.contract_num
    FROM accomodation_contract_t AS ac
    WHERE ac.room_num = NEW.room_num AND ac.ac_date = NEW.repair_date
);

/* dates */
SET @T_date := (
    SELECT ac.ac_date
    FROM accomodation_contract_t AS ac
    WHERE ac.room_num = NEW.room_num AND ac.ac_date = NEW.repair_date
);

/* student cards */
SET @T_stcard := (
    SELECT ac.student_card
    FROM accomodation_contract_t AS ac
    WHERE ac.room_num = NEW.room_num AND ac.ac_date = NEW.repair_date
);

/* free rooms */
SET @T_free := (
    SELECT room_t.room_num
    FROM accomodation_contract_t AS ac
    RIGHT JOIN room_t
        ON ac.room_num = room_t.room_num AND ac.ac_date = NEW.repair_date
    WHERE ac.room_num IS NULL
    LIMIT 1
);

/* create new accomodation contract based on the previous */
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUES (CURDATE(), @T_stcard, @T_free, @T_date);

/* deactivate previous accomodation contract */
UPDATE accomodation_contract_t
SET is_active = false
WHERE room_num = NEW.room_num
    AND ac_date = NEW.repair_date;

END $$
DELIMITER ;

/* 4) start repair in the old room - after student left it & moved to another room */
INSERT INTO repair_t (room_num, repair_date)
    VALUE ("503a-1", '2020-07-01');

/* 5) show new state of contracts journal */
SELECT *
FROM accomodation_contract_t;

