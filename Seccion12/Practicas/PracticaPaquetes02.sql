SET SERVEROUT ON
CREATE OR REPLACE PACKAGE NOMINA
IS
   FUNCTION CALCULAR_NOMINA (COD NUMBER) RETURN NUMBER;
   FUNCTION CALCULAR_NOMINA (COD NUMBER, PORC VARCHAR2) RETURN NUMBER;
   FUNCTION CALCULAR_NOMINA (COD NUMBER, PORC NUMBER, PARM VARCHAR2:='V') RETURN NUMBER;
END;

CREATE OR REPLACE
PACKAGE BODY NOMINA AS

  FUNCTION CALCULAR_NOMINA(COD NUMBER) RETURN NUMBER 
  IS
  RESULTADO NUMBER;
  SALARIO employees.salary%TYPE;
  BEGIN
    SELECT salary into SALARIO FROM employees WHERE employee_id = COD;
    RESULTADO:=SALARIO-(SALARIO*0.15);
    RETURN RESULTADO;
  END;

  FUNCTION CALCULAR_NOMINA(COD NUMBER, PORC VARCHAR2) RETURN NUMBER 
  IS
  RESULTADO NUMBER;
  SALARIO employees.salary%TYPE;
  BEGIN
    SELECT salary into SALARIO FROM employees WHERE employee_id = COD;
    RESULTADO:=SALARIO-((SALARIO*TO_NUMBER(PORC))/100);
    RETURN RESULTADO;
  END;
  
  FUNCTION CALCULAR_NOMINA(COD NUMBER, PORC NUMBER, PARM VARCHAR2:='V') RETURN NUMBER 
  IS
  RESULTADO NUMBER;
  SALARIO employees.salary%TYPE;
  COMISION employees.commission_pct%TYPE;
  BEGIN
    SELECT salary, commission_pct into SALARIO, COMISION FROM employees WHERE employee_id = COD;
    RESULTADO:=SALARIO-((SALARIO*PORC)/100)+(SALARIO*COMISION);
    RETURN RESULTADO;
  END;

END NOMINA;


DECLARE
    SALARIO NUMBER;
    empleado number;
BEGIN
    empleado:=150;
    SALARIO:=nomina.calcular_nomina(empleado);
    dbms_output.put_line('El salario total del empleado es: $'||SALARIO);
    SALARIO:=nomina.calcular_nomina(empleado,10,'ALGO');
    dbms_output.put_line('El salario total del empleado es: $'||SALARIO);
    SALARIO:=nomina.calcular_nomina(empleado,'10');
    dbms_output.put_line('El salario total del empleado es: $'||SALARIO);
END;
    