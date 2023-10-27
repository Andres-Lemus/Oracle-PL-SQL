SET SERVEROUT ON
DECLARE
    c1 VARCHAR2(400);
BEGIN
    select json_value(prod1.datos,'$.pais') into c1 from productos1 prod1 where codigo=3;
    dbms_output.put_line(c1);
      
    select json_value(prod1.datos,'$.direccion') into c1 from productos1 prod1 where codigo=3;
    dbms_output.put_line(c1);
       
    select json_value(prod1.datos,'$.direccion.calle') into c1 from productos1 prod1 where codigo=3;
    dbms_output.put_line(c1);
      
    select json_query(prod1.datos,'$.direccion') into c1 from productos1 prod1 where codigo=3;
      dbms_output.put_line(c1);
      
    select json_query(prod1.datos,'$.direccion.calle') into c1 from productos1 prod1 where codigo=3;
    dbms_output.put_line(c1);
      
    select json_transform(datos, rename '$.poblacion'='pob') into c1 from productos1 where codigo=3;
    dbms_output.put_line(c1);
END;