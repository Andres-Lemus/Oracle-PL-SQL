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
        dbms_output.put_line('''' || tipo_producto || ''' --> Electrónica');
    ELSIF tipo_producto = 'B' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Informática');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Ropa');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Música');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('''' || tipo_producto || ''' --> Libros');
    ELSE
         dbms_output.put_line('El código es incorrecto');   
    END IF;
END;