create or replace TYPE PRODUCTO  AS OBJECT (

--Atributos
codigo number,
nombre varchar2(100),
precio number,

--Métodos
MEMBER FUNCTION ver_producto RETURN VARCHAR2 ,
MEMBER FUNCTION ver_precio  RETURN NUMBER,
MEMBER FUNCTION ver_precio(impuestos NUMBER) RETURN NUMBER,
MEMBER PROCEDURE cambiar_precio(precio number),
MEMBER PROCEDURE mayus,
STATIC PROCEDURE auditoria,
CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT
)
NOT FINAL;