DECLARE
    X NUMBER;
BEGIN
    UPDATE TEST SET C2='PPPPPPP' WHERE C1=100;
    DBMS_OUTPUT.put_line(SQL%ROWCOUNT);
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ENCONTRADO');
    END IF;
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO ENCONTRADO');
    END IF;
    SELECT C1 INTO X FROM TEST WHERE C1=1000;
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('FILA NO EXISTE');
    END IF;
END;