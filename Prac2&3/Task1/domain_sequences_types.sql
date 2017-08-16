-- ENUMS

CREATE TYPE TITLE AS ENUM ('Ms', 'Mev', 'Miss', 'Mrs', 'Mr', 'Mnr');
CREATE TYPE SUPERVISOR_TITLE AS ENUM ('Ms', 'Mev', 'Miss', 'Mrs', 'Mr', 'Mnr', 'Prof', 'Dr');
CREATE TYPE CATEGORY AS ENUM ('part-time', 'full-time');

-- TYPES

CREATE TYPE supervisor AS (
    title SUPERVISOR_TITLE,
    first_name TEXT,
    last_name TEXT
);

-- DOMAINS 

CREATE DOMAIN student_number AS TEXT CHECK (
    VALUE ~ '\d{6}$'
);

-- SEQUENCES

CREATE SEQUENCE student_key 	START 101;
CREATE SEQUENCE degree_key 		START 201;
CREATE SEQUENCE course_key		START 301;