-- Punto #1 y #2
CREATE OR REPLACE FUNCTION TOTAL_DEPARTMENTOS
    (DEPT IN employees.department_id%TYPE,
    NUM_EMPL OUT NUMBER)
RETURN NUMBER
IS
  TOTAL NUMBER:=0;
  EMPLEADOS NUMBER:=0;
  EXISTE employees.department_id%TYPE;
BEGIN
    
    SELECT department_id INTO EXISTE FROM departments WHERE department_id = DEPT;
    
    SELECT COUNT(*) INTO EMPLEADOS FROM employees 
    WHERE department_id=DEPT;

   IF empleados > 0 THEN 
        SELECT SUM(SALARY), COUNT(*) INTO TOTAL, NUM_EMPL FROM EMPLOYEES WHERE department_id=DEPT
        GROUP BY department_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20730,'EL DEPARTAMENTO NO TIENE EMPLEADOS');
   END IF;
   RETURN TOTAL;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
       raise_application_error (-20730,'No existe el departamento ' || DEPT);
END;
/
set serveroutput on
DECLARE
  DEPT_ID employees.department_id%TYPE;
  NUM_EMPL NUMBER;
  SUMA NUMBER;
BEGIN
    DEPT_ID:=10;
    SUMA:=total_departmentos(DEPT_ID,NUM_EMPL);
    DBMS_OUTPUT.PUT_LINE('Número de empleados: '||num_empl);
    DBMS_OUTPUT.PUT_LINE('Suma de salarios: '||SUMA);
END;
/


-- Punto #3
CREATE OR REPLACE FUNCTION CREA_REGION
    (NOM_REGION IN VARCHAR2)
RETURN NUMBER
IS
  MAX_ID regions.region_id%TYPE;
  SAL NUMBER:=0;
BEGIN
    
    SELECT MAX(REGION_ID) INTO MAX_ID FROM REGIONS;
    
    INSERT INTO REGIONS VALUES(MAX_ID+1,NOM_REGION);
    
    SELECT MAX(REGION_ID) INTO MAX_ID FROM REGIONS;
    
    RETURN MAX_ID;
END;
/
DECLARE
  region regions.region_name%TYPE;
  reg_id NUMBER;
BEGIN
    region:='Oceania';
    reg_id:=CREA_REGION(region);
    DBMS_OUTPUT.PUT_LINE('ID de Region Insertada: '||reg_id);
END;