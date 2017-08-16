-- PERSON

CREATE TABLE person(
    title TITLE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

--STUDENT

CREATE TABLE student(
    student_key INTEGER DEFAULT nextval('student_key') NOT NULL,
    student_number student_number NOT NULL,
    date_of_birth DATE NOT NULL,
    year_of_study INTEGER NOT NULL,
    degree_code TEXT NOT NULL,
    PRIMARY KEY (student_key)
) INHERITS (person);

-- UNDERGRADUATE

CREATE TABLE undergraduate(
    courseRegistration TEXT[]
) INHERITS (student);

--POSTGRADUATE

CREATE TABLE postgraduate (
    category CATEGORY,
    supervisor supervisor
) INHERITS (student);

-- DEGREE PROGRAM

CREATE TABLE degreeprogram (
    degree_key INTEGER DEFAULT nextval('degree_key') NOT NULL,
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    faculty TEXT NOT NULL,
    number_of_years INTEGER NOT NULL,
    PRIMARY KEY (degree_key)
);

-- COURSE

CREATE TABLE course (
    course_key INTEGER DEFAULT nextval('course_key') NOT NULL,
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    credits INTEGER NOT NULL,
    PRIMARY KEY (course_key)
);

-- DELETED UNDERGRADUATE

CREATE TABLE deletedundergraduate (
    like undergraduate
    including defaults
    including constraints
    including indexes,
    theUser TEXT NOT NULL,
    deletionTime DATE NOT NULL
);

-- DELETED POSTGRADUATE

CREATE TABLE deletedpostgraduate (
    like postgraduate
    including defaults
    including constraints
    including indexes,
    theUser TEXT NOT NULL,
    deletionTime DATE NOT NULL
);