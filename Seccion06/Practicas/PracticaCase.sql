SET SERVEROUT ON
DECLARE
    usuario VARCHAR2(40);
BEGIN
    usuario:=USER;
    CASE usuario
        WHEN 'SYS' THEN DBMS_OUTPUT.PUT_LINE('Eres superadministrador');
        WHEN 'SYSTEM' THEN DBMS_OUTPUT.PUT_LINE('Eres un administrador normal');
        WHEN 'HR' THEN DBMS_OUTPUT.PUT_LINE('Eres de Recursos Humanos');
        ELSE DBMS_OUTPUT.PUT_LINE('Usuario no autorizado');
        END CASE;
END;