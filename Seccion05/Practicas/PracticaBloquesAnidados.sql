-- Punto #1
SET SERVEROUTPUT ON
DECLARE
X NUMBER:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);
DECLARE
X NUMBER:=20;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);
END;
DBMS_OUTPUT.PUT_LINE(X);
END;

-- Punto #2 - Soluci�n: Faltaba declarar la variable en el bloque padre
DECLARE
X NUMBER:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);
DECLARE
X NUMBER:=20;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);
END;
DBMS_OUTPUT.PUT_LINE(X);
END;

-- Punto #3
SET SERVEROUTPUT ON
DECLARE
X NUMBER:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);

BEGIN
DBMS_OUTPUT.PUT_LINE(X);
END;
DBMS_OUTPUT.PUT_LINE(X);
END;