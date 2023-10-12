-- Punto #1
SET SERVEROUT ON
DECLARE
    salario_maximo employees.salary%TYPE;
BEGIN
    SELECT MAX(salary) INTO salario_maximo FROM EMPLOYEES
    WHERE department_id = 100;
    DBMS_OUTPUT.put_line(salario_maximo);
END;

-- Punto #2
DECLARE
    tipo_trabajo employees.job_id%TYPE;
BEGIN
    SELECT job_id INTO tipo_trabajo FROM EMPLOYEES
    WHERE employee_id = 100;
    DBMS_OUTPUT.put_line(tipo_trabajo);
END;

-- Punto #3
DECLARE
    departamento_id employees.department_id%TYPE := 100;
    empleados NUMBER;
    departamento departments.department_name%TYPE;
BEGIN
    SELECT COUNT(*) INTO empleados FROM EMPLOYEES
    WHERE employee_id = departamento_id;
    SELECT department_name INTO departamento FROM departments
    WHERE department_id = departamento_id;
    DBMS_OUTPUT.put_line(departamento);
    DBMS_OUTPUT.put_line(empleados);
END;

-- Punto #4
DECLARE
    salario_maximo employees.salary%TYPE;
    salario_minimo employees.salary%TYPE;
BEGIN
    SELECT MAX(salary), MIN(salary) INTO salario_maximo, salario_minimo FROM EMPLOYEES;
    DBMS_OUTPUT.put_line(salario_maximo - salario_minimo);
END;