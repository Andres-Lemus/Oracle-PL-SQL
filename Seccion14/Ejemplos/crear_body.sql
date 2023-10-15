create or replace TYPE body PRODUCTO  AS 
MEMBER FUNCTION ver_producto RETURN VARCHAR2 as 
begin
    return codigo||' '||nombre||' '||precio;

end ver_producto;

MEMBER FUNCTION ver_precio  RETURN NUMBER as
begin
  return precio;
end ver_precio;

MEMBER FUNCTION ver_precio(impuestos NUMBER)  RETURN NUMBER as
begin
  return precio - (precio*impuestos)/100;
end ver_precio;

MEMBER PROCEDURE cambiar_precio(precio number) as
begin
  SELF.precio:=precio;
end cambiar_precio;

MEMBER PROCEDURE mayus AS
BEGIN
    nombre:=UPPER(nombre);
END;

STATIC PROCEDURE auditoria
AS
BEGIN
    INSERT INTO auditoria values(USER, SYSDATE);
END;

CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT
IS
BEGIN
    SELF.nombre:=n1;
    SELF.precio:=NULL;
    SELF.codigo:= SEQ1.NEXTVAL;
    RETURN;
END;

end;
/