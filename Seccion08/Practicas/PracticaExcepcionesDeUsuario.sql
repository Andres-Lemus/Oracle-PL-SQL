DECLARE
   CONTROL_REGIONES EXCEPTION;
   REGION_COD regions.region_id%TYPE;
   REGION_NOMBRE regions.region_name%TYPE;
BEGIN
   REGION_COD:=222;
   REGION_NOMBRE:='Oceania';
   IF REGION_COD > 200 THEN
         RAISE CONTROL_REGIONES;  
    ELSE
       insert into regions values (REGION_COD,REGION_NOMBRE);
       commit;
      END IF;
    EXCEPTION
      WHEN CONTROL_REGIONES THEN  
        DBMS_OUTPUT.PUT_LINE('Codigo no permitido. Debe ser inferior a 200');
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error indefinido');
END;