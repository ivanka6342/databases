SET NAMES utf8;
USE dormitory_db;


LOCK TABLE dormitory_t WRITE;
INSERT
    INTO dormitory_t (dorm_num, dorm_address, dorm_mentor, dorm_commandant)
    VALUE (1, "Kolasa, 28", "Наумова Светлана Леонидовна", "Наумова Светлана Леонидовна");
INSERT
    INTO dormitory_t (dorm_num, dorm_address, dorm_mentor, dorm_commandant)
    VALUE (2, "Bedy, 4", "Василевская Светлана Петровна", "Василевская Светлана Петровна");
INSERT
    INTO dormitory_t (dorm_num, dorm_address, dorm_mentor, dorm_commandant)
    VALUE (3, "Bedy, 2", "Медведева Ирина Леонидовна", "Медведева Ирина Леонидовна");
INSERT
    INTO dormitory_t (dorm_num, dorm_address, dorm_mentor, dorm_commandant)
    VALUE (4, "Dzerjinskogo, 95", "Денисова Светлана Михайловна", "Денисова Светлана Михайловна");
UNLOCK TABLE;


LOCK TABLE floor_mentor_t WRITE;
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("rwr-14.nc1", "Лукомская", "Лилия", 5, 1);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("skf-15.nc1", "Измер", "Татьяна", 3, 1);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("bbt-13.nc1", "Матюшкина", "Людмила", 8, 1);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("dvl-10.hc1", "Гридюшко", "Людмила", 9, 2);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("tdk-07.hc1", "Зубрицкая", "Наталья", 7, 2);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("pps-15.hc1", "Лакисова", "Ольга", 11, 2);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("kkj-11.hc1", "Кузнецова", "Татьяна", 2, 2);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("bdt-13.pc1", "Медведева", "Ирина", 5, 3);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("cbj-14.fc1", "Денисик", "Ирина", 11, 4);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("ssk-09.fc1", "Гурина", "Татьяна", 8, 4);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("gle-11.fc1", "Азаронок", "Светлана", 4, 4);
INSERT
    INTO floor_mentor_t (contract_num, first_name, second_name, floor_num, dorm_num)
    VALUE ("lgt-12.fc1", "Голубева", "Татьяна", 12, 4);
UNLOCK TABLE;


LOCK TABLE room_t WRITE;
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("503a-1", 1, 5, 4.3, "rwr-14.nc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("303b-1b", 1, 3, 4.1, "skf-15.nc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("811b-1", 1, 8, 4.3, "bbt-13.nc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("927b-2", 2, 9, 4.1, "dvl-10.hc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("714a-2", 2, 7, 4.3, "tdk-07.hc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("1103b-2", 2, 11, 4.1, "pps-15.hc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("204b-2", 2, 2, 4.3, "kkj-11.hc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("501-3", 3, 5, 4.1, "bdt-13.pc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("1111b-4", 4, 11, 4.3, "cbj-14.fc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("810a-4", 4, 8, 4.1, "ssk-09.fc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("404b-4", 4, 4, 4.3, "gle-11.fc1");
INSERT
    INTO room_t (room_num, dorm_num, floor_num, mark, floor_mentor)
    VALUE ("1202b-4", 4, 12, 4.1, "lgt-12.fc1");
UNLOCK TABLE;


LOCK TABLE job_t WRITE;
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (2, "rwr-14.nc1", 12);
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (2, "skf-15.nc1", 15);
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (4, "bbt-13.nc1", 20);
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (4, "dvl-10.hc1", 8);
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (2, "tdk-07.hc1", 12);
INSERT
    INTO job_t (dorm_num, floor_mentor, hour_count)
    VALUE (2, "pps-15.hc1", 12);
UNLOCK TABLE;


LOCK TABLE pass_card_t WRITE;
INSERT
    INTO pass_card_t (card_num, dorm_num, student_card, exp_date)
    VALUE ("123-F45", 4, 1, '2020-07-01');
INSERT
    INTO pass_card_t (card_num, dorm_num, student_card, exp_date)
    VALUE ("12df=45", 2, 2, '2020-07-01');
INSERT
    INTO pass_card_t (card_num, dorm_num, student_card, exp_date)
    VALUE ("fg3gFrg", 1, 3, '2020-07-01');
INSERT
    INTO pass_card_t (card_num, dorm_num, student_card, exp_date)
    VALUE ("fdGG4_5", 3, 4, '2020-07-01');
INSERT
    INTO pass_card_t (card_num, dorm_num, student_card, exp_date)
    VALUE ("e5-F4Gb", 2, 5, '2020-07-01');
UNLOCK TABLE;


LOCK TABLE student_t WRITE;
INSERT
    INTO student_t (student_card_num, stud_group, course, faculty, first_name, second_name, pass_card, work_scope)
    VALUE (1, "650505", 4, "fksis", "Алексей", "Петров", "123-F45", 40);
INSERT
    INTO student_t (student_card_num, stud_group, course, faculty, first_name, second_name, pass_card, work_scope)
    VALUE (2, "730301", 3, "ief", "Максим", "Адрианов", "12df=45", 40);
INSERT
    INTO student_t (student_card_num, stud_group, course, faculty, first_name, second_name, pass_card, work_scope)
    VALUE (3, "831421", 2, "fik", "Иван", "Самойленко", "fg3gFrg", 40);
INSERT
    INTO student_t (student_card_num, stud_group, course, faculty, first_name, second_name, pass_card, work_scope)
    VALUE (4, "800001", 2, "fkp", "Артём", "Крополев", "fdGG4_5", 40);
INSERT
    INTO student_t (student_card_num, stud_group, course, faculty, first_name, second_name, pass_card, work_scope)
    VALUE (5, "662402", 4, "fre", "Владислав", "Сталлен", "e5-F4Gb", 40);
UNLOCK TABLE;


ALTER TABLE pass_card_t
    ADD FOREIGN KEY (student_card) REFERENCES student_t (student_card_num);


LOCK TABLE accomodation_contract_t WRITE;
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1234abc", 1, "503a-1", '2020-07-01');
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1235abc", 2, "303b-1b", '2020-07-01');
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1236abc", 3, "811b-1", '2020-07-01');
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1237abc", 4, "927b-2", '2020-07-01');
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1238abc", 5, "714a-2", '2020-07-01');
INSERT
    INTO accomodation_contract_t (contract_num, student_card, room_num, ac_date)
    VALUE ("1239abc", 5, "714a-2", '2019-07-01');
UNLOCK TABLE;


LOCK TABLE journal_entry_t WRITE;
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (1, 2, 3, '2019-11-21');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (2, 1, 5, '2019-10-12');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (3, 2, 1, '2019-11-17');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (4, 4, 2, '2019-10-27');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (5, 3, 4, '2019-11-07');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (6, 3, 4, '2019-09-28');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (7, 1, 3, '2019-09-28');
INSERT
    INTO journal_entry_t (id, student_card, job_id, je_date)
    VALUE (8, 1, 2, '2019-09-28');
UNLOCK TABLE;
