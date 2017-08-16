-- INSERTING INTO DEGREE PROGRAM

INSERT INTO degreeprogram (code, name, number_of_years, faculty) VALUES ('BSc', 'Bachelor of Science', 3, 'EBIT');
INSERT INTO degreeprogram (code, name, number_of_years, faculty) VALUES ('BIT', 'Bachelor of IT', 4, 'EBIT');
INSERT INTO degreeprogram (code, name, number_of_years, faculty) VALUES ('PhD', 'Philosophiae Doctor', 4, 'EBIT');

-- INSERTING INTO COURSE

INSERT INTO course (code, name, department, credits) VALUES ('COS301', 'Software Engineering', 'Computer Science', 40);
INSERT INTO course (code, name, department, credits) VALUES ('COS326', 'Database Systems', 'Computer Science', 20);
INSERT INTO course (code, name, department, credits) VALUES ('MTH301', 'Discrete Mathematics', 'Mathematics', 15);
INSERT INTO course (code, name, department, credits) VALUES ('PHL301', 'Logical Reasoning', 'Philosophy', 15);

-- INSERTING INTO UNDERGRADUATE

INSERT INTO undergraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
                   VALUES ('140010',       'Ms',  'Hanna',      'Pražak',  '01-10-1996',  'BSc',       3,             '{"COS301","COS326","MTH301"}'      );
INSERT INTO undergraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
                   VALUES ('140015',       'Mr',  'Geraint',      'Von Ingersleben',  '25-05-1995',  'BSc',       3,             '{"COS301","PHL301","MTH301"}'      );
INSERT INTO undergraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
                   VALUES ('131120',       'Mrs',  'Sneha',      'Abbot',  '30-01-1995',  'BIT',       3,             '{"COS301","COS326","PHL301"}'      );
INSERT INTO undergraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, courseregistration)
                   VALUES ('131149',       'Mev',  'Yanni',      'Milovanović',  '20-02-1996',  'BIT',       4,             '{"COS301","COS326","MTH301","PHL301"}'      );

-- INSERTING INTO POSTGRADUATE

DELETE FROM postgraduate;
INSERT INTO postgraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, category,    supervisor)
                  VALUES ('101122',       'Mr',  'Sheldon',      'Fleming',  '15-06-1987',  'PhD',       2,             'full-time', ('Dr','Alice', 'Silva'));
INSERT INTO postgraduate (student_number, title, first_name, last_name, date_of_birth, degree_code, year_of_study, category,    supervisor)
                  VALUES ('121101',       'Mrs',  'Lillian',      'Howell',  '27-04-1985',  'PhD',       3,             'part-time', ('Prof','Amanda', 'Holmes'));
