-- Punto #1
DECLARE
    NOMBRE employees.first_name%TYPE;
    CODIGO employees.employee_id%TYPE;
BEGIN
    CODIGO:=10;
    SELECT first_name INTO NOMBRE FROM employees
    WHERE employee_id = CODIGO;
    DBMS_OUTPUT.PUT_LINE(nombre);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Empleado Inexistente');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Indefinido');
END;
/
-- Punto #2
DECLARE
    NOMBRE employees.first_name%TYPE;
    CODIGO employees.employee_id%TYPE;
BEGIN
    CODIGO:=100;
    SELECT first_name INTO NOMBRE FROM employees
    WHERE employee_id > CODIGO;
    DBMS_OUTPUT.PUT_LINE(nombre);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Empleado Inexistente');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Demasiados Empleados en la consulta');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Indefinido');
END;
/
-- Punto #3
DECLARE
    SALARIO employees.salary%TYPE;
    CODIGO employees.employee_id%TYPE;
BEGIN
    CODIGO:=100;
    SELECT salary/0 INTO SALARIO FROM employees
    WHERE employee_id = CODIGO;
    DBMS_OUTPUT.PUT_LINE(SALARIO);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Empleado Inexistente');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Demasiados Empleados en la consulta');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' | Mensaje: ' || SQLERRM);
END;
/
-- Punto #4
DECLARE
   PK_DUPLICADO EXCEPTION;
   PRAGMA EXCEPTION_INIT(PK_DUPLICADO,-00001);
   V1 NUMBER;
   V2 NUMBER;
BEGIN
    INSERT INTO REGIONS VALUES(3, 'Oceanía');
EXCEPTION
   WHEN PK_DUPLICADO THEN 
       DBMS_OUTPUT.PUT_LINE('Clave duplicada, intente otra');
   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Indefinido');
END;