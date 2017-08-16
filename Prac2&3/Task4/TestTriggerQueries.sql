-- TEST 1
INSERT INTO undergraduate 
    (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
    VALUES ('140010', 'Ms', 'Red', 'Rabbit', '01-10-1996', 'MAGIC', 3, '{"COS301"}');

-- TEST 2
INSERT INTO undergraduate 
    (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
    VALUES ('140010', 'Ms', 'Grey', 'Goose', '01-10-1996', 'BSc', 3, '{"COS111"}');

-- TEST 3
INSERT INTO postgraduate
	(student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, category, supervisor)
	VALUES ('101122','Mr', 'Blue', 'Bird', '15-06-1987', 'MAGIC', 2, 'full-time', ('Dr','Purple', 'Phish'));

-- TEST 4
UPDATE undergraduate SET degree_code = 'MAGIC';

-- TEST 5
UPDATE undergraduate SET courseregistration = '{"COS111"}';

-- TEST 6
UPDATE postgraduate SET degree_code = 'MAGIC';

-- TEST 7
DELETE FROM undergraduate WHERE student_key = (SELECT student_key FROM undergraduate LIMIT 1);

-- TEST 8
DELETE FROM postgraduate WHERE student_key = (SELECT student_key FROM postgraduate LIMIT 1);