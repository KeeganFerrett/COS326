CREATE TRIGGER check_valid_degree BEFORE INSERT OR UPDATE ON student
    FOR EACH ROW EXECUTE PROCEDURE checkValidDegreeCode();

CREATE TRIGGER check_valid_degree BEFORE INSERT OR UPDATE ON postgraduate
    FOR EACH ROW EXECUTE PROCEDURE checkValidDegreeCode();

CREATE TRIGGER check_valid_degree BEFORE INSERT OR UPDATE ON undergraduate
    FOR EACH ROW EXECUTE PROCEDURE checkValidDegreeCode();

CREATE TRIGGER check_valid_course_registration BEFORE INSERT OR UPDATE ON undergraduate
    FOR EACH ROW EXECUTE PROCEDURE checkValidCourseCode();

CREATE TRIGGER audit_delete_undergrad BEFORE DELETE ON undergraduate
    FOR EACH ROW EXECUTE PROCEDURE recordDeleteUndergrad();

CREATE TRIGGER audit_delete_postgrad BEFORE DELETE ON postgraduate
FOR EACH ROW EXECUTE PROCEDURE recordDeletePostgrad();