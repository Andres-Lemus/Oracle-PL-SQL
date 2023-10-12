-- Punto #1
SET SERVEROUT ON
DECLARE
    ULTIMO departments.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO ULTIMO FROM departments;
    ULTIMO:=ULTIMO+1;
    INSERT INTO departments VALUES (ULTIMO, 'INFORMATICA',100,1000);
    COMMIT;
END;
/

DECLARE
    ULTIMO departments.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO ULTIMO FROM departments;
    UPDATE departments SET location_id = 1700 WHERE department_id = ULTIMO;
    COMMIT;
END;
/

DECLARE
    ULTIMO departments.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO ULTIMO FROM departments;
    DELETE FROM departments WHERE department_id = ULTIMO;
    COMMIT;
END;
/

SELECT * FROM departments;

