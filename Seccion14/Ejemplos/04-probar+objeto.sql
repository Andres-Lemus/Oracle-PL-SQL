set serveroutput on format wrapped line 1000;

declare
    v1 producto:=producto('manzanas');
begin
    dbms_output.put_line(v1.ver_producto());
    dbms_output.put_line(v1.ver_precio());
    v1.cambiar_precio(20);
    dbms_output.put_line(v1.ver_precio());
    v1.mayus();
    dbms_output.put_line(v1.ver_producto());
    v1.nombre:='pera';
    dbms_output.put_line(v1.ver_producto());
    producto.auditoria();
end;
/

/*DROP SEQUENCE SEQ1;
CREATE SEQUENCE SEQ1;*/