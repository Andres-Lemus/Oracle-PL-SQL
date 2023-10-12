-- Incorrecto
/*BEGIN
 END;*/
 
-- Incorrecto
 /*DECLARE x INTEGER(10);
 END;*/
 
-- Incorrecto
 /*DECLARE
 BEGIN
 END;*/
 
-- Correcto
 DECLARE
    x INTEGER(10);
BEGIN
    dbms_output.put_line(x);
END;
 
-- Punto #2
SET SERVEROUT ON
DECLARE
    x  INTEGER(10):=30;
    y  INTEGER(10):=20;
BEGIN
    dbms_output.put_line(x + y);
END;

-- Punto #3
SET SERVEROUT ON
DECLARE
    x  INTEGER(10):=null;
    y  INTEGER(10):=20;
BEGIN
    dbms_output.put_line(x + y);
END;

-- Punto #4
SET SERVEROUT ON
DECLARE
    x  INTEGER(10):=10;
    y  INTEGER(10):=20;
    z  CONSTANT INTEGER(10):=30;
BEGIN
    Z:=40;
    dbms_output.put_line(x + y + Z);
END;

SET SERVEROUT ON
DECLARE
    NAME VARCHAR2(20):='Andres';
    AGE INTEGER(10):=22;
    BIRTHDATE DATE:='30-04-2001';
BEGIN
    DBMS_OUTPUT.PUT_LINE(name);
    DBMS_OUTPUT.PUT_LINE(age);
    DBMS_OUTPUT.PUT_LINE(birthdate);
    dbms_output.put_line('Nombre: ' || name || ' Edad: ' || age || ' Nacimiento: ' || birthdate);
END;