SET SERVEROUT ON
DECLARE
    X NUMBER:=201;
BEGIN
    IF
        MOD(x,2) = 0
    THEN
        dbms_output.put_line('El numero es par');
    ELSE
        dbms_output.put_line('El numero es impar'); 
    END IF;    
END;

DECLARE
    TIPO_PRODUCTO CHAR(1):='D';
BEGIN
    IF tipo_producto = 'A' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Electr�nica');
    ELSIF tipo_producto = 'B' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Inform�tica');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Ropa');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> M�sica');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Libros');
    ELSE
         dbms_output.put_line('El c�digo es incorrecto');   
    END IF;
END;