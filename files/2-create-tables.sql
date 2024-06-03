SET NAMES utf8;
USE dormitory_db;
SHOW TABLES;

DROP TABLE IF EXISTS room_t;
DROP TABLE IF EXISTS journal_entry_t;
DROP TABLE IF EXISTS job_t;
DROP TABLE IF EXISTS floor_mentor_t;
DROP TABLE IF EXISTS student_t;
DROP TABLE IF EXISTS pass_card_t;
DROP TABLE IF EXISTS accomodation_contract_t;
DROP TABLE IF EXISTS dormitory_t;

CREATE TABLE dormitory_t (
    dorm_num DEC NOT NULL,
    dorm_address VARCHAR(255) NOT NULL,
    dorm_mentor VARCHAR(255) NOT NULL COMMENT 'заведующий',
    dorm_commandant VARCHAR(255) NOT NULL COMMENT 'комендант',
    PRIMARY KEY (dorm_num)
);

CREATE TABLE floor_mentor_t (
    contract_num VARCHAR(255) NOT NULL COMMENT 'трудовой контракт',
    first_name VARCHAR(255) NOT NULL,
    second_name VARCHAR(255) NOT NULL,
    floor_num DEC NOT NULL COMMENT 'главный этаж',
    dorm_num DEC NOT NULL,
    PRIMARY KEY (contract_num),
    FOREIGN KEY (dorm_num) REFERENCES dormitory_t (dorm_num)
);

CREATE TABLE room_t (
    room_num VARCHAR(255) NOT NULL,
    dorm_num DEC NOT NULL,
    floor_num DEC NOT NULL,
    mark FLOAT NOT NULL COMMENT 'средний балл по состоянию комнаты',
    floor_mentor VARCHAR(255) NOT NULL COMMENT 'ответственный воспитатель',
    PRIMARY KEY (room_num),
    FOREIGN KEY (dorm_num) REFERENCES dormitory_t (dorm_num),
    FOREIGN KEY (floor_mentor) REFERENCES floor_mentor_t (contract_num)
);

CREATE TABLE job_t (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    dorm_num DEC NOT NULL,
    floor_mentor VARCHAR(255) NOT NULL COMMENT 'ответственный воспитатель',
    hour_count DEC NOT NULL COMMENT 'затраченное количество часов',
    PRIMARY KEY (id),
    FOREIGN KEY (dorm_num) REFERENCES dormitory_t (dorm_num),
    FOREIGN KEY (floor_mentor) REFERENCES floor_mentor_t (contract_num)
);

CREATE TABLE pass_card_t (
    card_num VARCHAR(255) NOT NULL COMMENT 'номер пропуска',
    dorm_num DEC NOT NULL,
    student_card INT unsigned NOT NULL,
    exp_date DATE NOT NULL,
    PRIMARY KEY (card_num),
    FOREIGN KEY (dorm_num) REFERENCES dormitory_t (dorm_num)
);

CREATE TABLE student_t (
    student_card_num INT unsigned NOT NULL AUTO_INCREMENT,
    stud_group VARCHAR(255) NOT NULL,
    course DEC NOT NULL,
    faculty VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    second_name VARCHAR(255) NOT NULL,
    pass_card VARCHAR(255) NOT NULL COMMENT 'номер пропуска',
    work_scope DEC NOT NULL COMMENT 'количество часов ОПТ',
    PRIMARY KEY (student_card_num),
    FOREIGN KEY (pass_card) REFERENCES pass_card_t (card_num)
);

CREATE TABLE accomodation_contract_t (
    contract_num VARCHAR(255) NOT NULL COMMENT 'договор о проживании',
    student_card INT unsigned NOT NULL AUTO_INCREMENT,
    room_num VARCHAR(255) NOT NULL,
    ac_date DATE NOT NULL,
    PRIMARY KEY (contract_num),
    FOREIGN KEY (room_num) REFERENCES room_t (room_num),
    FOREIGN KEY (student_card) REFERENCES student_t (student_card_num)
);

CREATE TABLE journal_entry_t (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    student_card INT unsigned NOT NULL,
    job_id INT unsigned NOT NULL,
    je_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (student_card) REFERENCES student_t (student_card_num),
    FOREIGN KEY (job_id) REFERENCES job_t (id)
);

SHOW TABLES;
