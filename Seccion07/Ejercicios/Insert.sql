DECLARE
    COL1 test.c1%TYPE;
BEGIN
    COL1:=20;
    INSERT INTO TEST (C1,C2) VALUES (COL1, 'BBBBBBBB');
    COMMIT;
END;    