

CREATE OR REPLACE PROCEDURE visualizar
IS 
   CURSOR C1 IS SELECT * FROM employees;
BEGIN
   FOR I IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE(I.first_name||' '||I.last_name||' salario: $'||I.salary);
    END LOOP;
END;
/
EXECUTE visualizar;


CREATE OR REPLACE PROCEDURE visualizar 
(DEPT_ID IN EMPLOYEES.DEPARTMENT_ID%TYPE,
 NUM_EMPL OUT NUMBER)
 IS
    CONTAR NUMBER:=0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Empleados del Departamento '||dept_id);
   FOR I IN (SELECT * FROM EMPLOYEES WHERE department_id = DEPT_ID) LOOP
        DBMS_OUTPUT.PUT_LINE(I.first_name||' '||I.last_name||' salario: $'||I.salary);
        CONTAR:=CONTAR+1;
    END LOOP;
    NUM_EMPL:=CONTAR;
END;
/
set serveroutput on
DECLARE
  DEPT employees.department_id%TYPE;
  EMPLEADOS NUMBER;
begin
  DEPT:=100;
  EMPLEADOS:=0;
 visualizar(DEPT,EMPLEADOS);
 DBMS_OUTPUT.PUT_LINE('Cantidad de empleados en el departamento '||dept||': '||empleados);
end;
/


create or replace PROCEDURE FORMAT_NUMBER 
(numero IN OUT VARCHAR2)
IS
  NUM1 VARCHAR2(4);
  NUM2 VARCHAR2(4);
  NUM3 VARCHAR2(2);
  NUM4 VARCHAR2(10);
BEGIN
   /*IF LENGTH(numero) != 20 THEN 
      RAISE_APPLICATION_ERROR(-20000,'El número a formatear tiene que tener 20 dígitos');
    END IF;*/
   DBMS_OUTPUT.PUT_line('Número sin formateo: '||numero);
   NUM1:= SUBSTR(numero,1,4);
   NUM2:= SUBSTR(numero,5,4);
   NUM3:= SUBSTR(numero,9,2);
   NUM4:= SUBSTR(numero,11,10);
   numero := NUM1||'-'||NUM2||'-'||NUM3||'-'||NUM4;
END;
/
DECLARE
  NUMERO VARCHAR2(23);
BEGIN
    NUMERO:='11111111111111111111';
    FORMAT_NUMBER(NUMERO);
    DBMS_OUTPUT.PUT_LINE('Número formateado: '||NUMERO);
END;