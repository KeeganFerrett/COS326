-- isValidCourseCode

CREATE OR REPLACE FUNCTION isValidCourseCode(courseCode TEXT) RETURNS BOOLEAN AS
$$
BEGIN
    If not (exists (SELECT 1 FROM course WHERE code = courseCode LIMIT 1)) THEN
        RETURN false;
    ELSE
        RETURN true;
    END IF;
END
$$ LANGUAGE plpgsql;

-- hasValidCourseCode

CREATE OR REPLACE FUNCTION hasValidCourseCodes(courseRegistration TEXT[]) RETURNS BOOLEAN AS
$$
DECLARE
    courseCode text;
BEGIN
    FOREACH courseCode IN ARRAY courseRegistration LOOP
        If NOT (isValidCourseCode(courseCode)) THEN
            RETURN false;
        END IF;
    END LOOP;
    RETURN true;
END
$$ LANGUAGE plpgsql;

-- courseCodeFrequency

CREATE OR REPLACE FUNCTION courseCodeFrequency(courseRegistration TEXT[], courseCode TEXT) RETURNS INTEGER AS
$$
BEGIN
    RETURN (select count(*) from unnest(courseRegistration) element where element = courseCode);
END
$$ LANGUAGE plpgsql;

-- hasDuplicateCourseCodes

CREATE OR REPLACE FUNCTION hasDuplicateCourseCodes(courseRegistration TEXT[]) RETURNS BOOLEAN AS
$$
DECLARE
courseCode TEXT;
BEGIN
    FOREACH courseCode IN ARRAY courseRegistration LOOP
        IF (courseCodeFrequency(courseRegistration, courseCode) > 1) THEN
            RETURN TRUE;
        END IF;
    END LOOP;
    RETURN FALSE;
END
$$ LANGUAGE plpgsql;

-- isValidDegreeCode

CREATE OR REPLACE FUNCTION isValidDegreeCode(degreeCode TEXT) RETURNS BOOLEAN AS
$$
DECLARE
courseCode TEXT;
BEGIN
    If not (exists (SELECT 1 FROM degreeprogram WHERE code = degreeCode LIMIT 1)) THEN
        RETURN false;
    ELSE
        RETURN true;
    END IF;
END
$$ LANGUAGE plpgsql;

--CheckValidDegreeCode

CREATE OR REPLACE FUNCTION checkValidDegreeCode() RETURNS TRIGGER AS
$$
BEGIN
    IF (isValidDegreeCode(NEW.degree_code)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Invalid degree code!';
    END IF; 
END
$$ LANGUAGE plpgsql;

-- checkValidCourseCode

CREATE OR REPLACE FUNCTION checkValidCourseCode() RETURNS TRIGGER AS
$$
BEGIN
    IF (hasValidCourseCodes(NEW.courseRegistration) AND NOT hasDuplicateCourseCodes(NEW.courseRegistration)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Invalid course code!';
    END IF; 
END
$$ LANGUAGE plpgsql;

-- recordDeleteUndergrad

CREATE OR REPLACE FUNCTION recordDeleteUndergrad() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO deletedundergraduate VALUES ((OLD).*, current_user, now());
    RETURN OLD;
END
$$ LANGUAGE plpgsql;

-- recordDeletePostgrad

CREATE OR REPLACE FUNCTION recordDeletePostgrad() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO deletedpostgraduate VALUES ((OLD).*, current_user, now());
    RETURN OLD;
END
$$ LANGUAGE plpgsql;