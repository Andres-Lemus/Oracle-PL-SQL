-- Punto #1
DECLARE
    CURSOR C1 IS SELECT first_name, last_name, salary FROM EMPLOYEES;
BEGIN
    FOR I IN C1 LOOP
        IF I.first_name = 'Steven' AND I.last_name = 'King' THEN
            RAISE_APPLICATION_ERROR(-20300,'El salario del jefe no puede ser visto'); 
        ELSE
           DBMS_OUTPUT.PUT_LINE(I.first_name||' '||I.last_name||' salario: $'||I.salary);
        END IF;
    END LOOP;

END;
/

-- Punto #2
DECLARE
  CURSOR C1 IS SELECT * FROM employees;
  CURSOR C2(EMPLEADO departments.manager_id%TYPE) IS SELECT * FROM departments WHERE manager_id = EMPLEADO;
  DEPARTAMENTO DEPARTMENTS%ROWTYPE;
  ENCARGADO EMPLOYEES%ROWTYPE;
BEGIN
    FOR emp IN C1 LOOP
        OPEN C2(emp.employee_id);
        FETCH C2 INTO DEPARTAMENTO;
        IF C2%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE(emp.first_name||' no es encargado');
        ELSE
            DBMS_OUTPUT.PUT_LINE(emp.first_name||' es encargado del departamento '||DEPARTAMENTO.DEPARTMENT_NAME);
        END IF;
        CLOSE C2;
    END LOOP;
END;
/

-- Punto #3
DECLARE
  CURSOR C1(DEPT employees.department_id%TYPE) IS SELECT COUNT(*) FROM employees WHERE department_id = DEPT;
  cod departments.department_id%TYPE;
  empleados NUMBER;
BEGIN
    cod:=100;
  OPEN C1(cod);
  FETCH C1 INTO empleados;
  DBMS_OUTPUT.PUT_LINE('El número de empleados del departamento '||cod||' es: '||empleados);
  CLOSE C1;
END;
/

-- Punto #4
BEGIN
  FOR i IN (SELECT first_name FROM employees WHERE job_id = 'ST_CLERK') LOOP
    DBMS_OUTPUT.PUT_LINE(i.first_name);
  END LOOP;
END;
/

-- Punto #5
DECLARE
    emp employees%rowtype;
    CURSOR C1 IS SELECT * FROM employees FOR UPDATE;
BEGIN
    OPEN C1;
    LOOP
        FETCH C1 INTO emp;
        EXIT WHEN C1%notfound;
        IF emp.salary > 8000 THEN
           UPDATE employees SET SALARY=SALARY*1.02 WHERE CURRENT OF C1;
        ELSIF emp.salary < 800 THEN
            UPDATE employees SET SALARY=SALARY*1.03 WHERE CURRENT OF C1;
        END IF;
    END LOOP;
  CLOSE C1;
END;
/