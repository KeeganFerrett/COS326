-- PART 1
SELECT u.student_number, personFullNames(u), ageinYears(u), u.degree_code FROM undergraduate u WHERE isRegisteredFor(u, 'COS326');

-- PART 2
--SELECT '{COS301, COS326}' AS "Courses", hasValidCourseCodes('{"COS301","COS326"}'::text[]) AS "Is valid";
--SELECT '{COS111, WTW101}' AS "Courses", hasValidCourseCodes('{"COS111","WTW101"}'::text[]) AS "Is valid";

-- PART 3
--SELECT '{COS301, COS326}' AS "Courses", hasDuplicateCourseCodes('{"COS301","COS326"}'::text[]) AS "Has duplicates";
--SELECT '{COS301, COS301}' AS "Courses", hasDuplicateCourseCodes('{"COS301","COS301"}'::text[]) AS "Has duplicates";
