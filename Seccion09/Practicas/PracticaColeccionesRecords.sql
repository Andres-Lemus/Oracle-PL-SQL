-- Punto #1
SET SERVEROUT ON
DECLARE
    TYPE empleado IS RECORD
        (NAME VARCHAR2(100),
        SAL employees.salary%TYPE,
        COD_DEPT employees.department_id%TYPE);
        
    TYPE EMP IS TABLE OF
        empleado
    INDEX BY PLS_INTEGER;
        
    emp1 emp;
BEGIN
    FOR I IN 100..206 LOOP
        SELECT first_name||' '||last_name, salary, department_id INTO emp1(I) FROM employees WHERE employee_id = I;
    END LOOP;
    FOR I IN emp1.FIRST..emp1.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: '||emp1(I).NAME||' Salario: $'||emp1(I).SAL||' Departamento: '||emp1(I).COD_DEPT);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Primer empleado - Nombre: '||emp1(emp1.FIRST).NAME||' Salario: $'||emp1(emp1.FIRST).SAL||' Departamento: '||emp1(emp1.FIRST).COD_DEPT);
    DBMS_OUTPUT.PUT_LINE('Ultimo empleado - Nombre: '||emp1(emp1.LAST).NAME||' Salario: $'||emp1(emp1.LAST).SAL||' Departamento: '||emp1(emp1.LAST).COD_DEPT);
    DBMS_OUTPUT.PUT_LINE('Numero de Empleados: '||emp1.COUNT);
    FOR I IN emp1.FIRST..emp1.LAST LOOP
        IF emp1(I).SAL < 7000 THEN
            emp1.DELETE(I);
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Numero de Empleados mayores de 7000 de salario: '||emp1.COUNT);
END;