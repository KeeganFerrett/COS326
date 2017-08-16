-- personFullNames(person)

CREATE OR REPLACE FUNCTION personFullNames(person student) RETURNS text AS
$$
BEGIN
    RETURN CONCAT(person.title, ' ', person.first_name, ' ', person.last_name);
END
$$ LANGUAGE plpgsql;

-- ageInYears(student)

CREATE OR REPLACE FUNCTION ageInYears(person student) RETURNS int AS
$$
BEGIN
    RETURN CAST(EXTRACT(YEAR from AGE(person.date_of_birth)) AS int);
END
$$ LANGUAGE plpgsql;

-- isRegisteredFor(undergrad, text)

CREATE OR REPLACE FUNCTION isRegisteredFor(person undergraduate, course text) RETURNS boolean AS
$$
BEGIN
    RETURN (course = ANY(person.courseregistration));
END
$$ LANGUAGE plpgsql;

-- isFinalYearStudent(undergrad)

CREATE OR REPLACE FUNCTION isFinalYearStudent(person undergraduate) RETURNS boolean AS
$$
BEGIN
    RETURN (person.year_of_study = (SELECT number_of_years FROM degreeprogram WHERE code = person.degree_code));
END
$$ LANGUAGE plpgsql;

-- isFinalYearStudent(postgrad)

CREATE OR REPLACE FUNCTION isFullTime(person postgraduate) RETURNS boolean AS
$$
BEGIN
    RETURN (person.category = 'full-time');
END
$$ LANGUAGE plpgsql;

-- isPartTime(postgrad)

CREATE OR REPLACE FUNCTION isPartTime(person postgraduate) RETURNS boolean AS
$$
BEGIN
    RETURN (person.category = 'part-time');
END
$$ LANGUAGE plpgsql;

-- personFullNames(postgrad)

CREATE OR REPLACE FUNCTION personFullNames(person supervisor) RETURNS text AS
$$
BEGIN
    RETURN (CONCAT(person.title, ' ', person.first_name, ' ', person.last_name));
END
$$ LANGUAGE plpgsql;