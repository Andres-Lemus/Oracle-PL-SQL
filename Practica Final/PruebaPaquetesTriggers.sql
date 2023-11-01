set serveroutput on
DECLARE
    COD_FACTURA NUMBER;
    LINEAS NUMBER;
    TOTAL_F NUMBER;
    TOTAL_FP NUMBER;
BEGIN
    cod_factura:=1;
    facturasp.baja_factura(cod_factura);
    --total_fp := facturasp.total_factura(cod_factura);
    --TOTAL_F := facturasp.num_facturas(SYSDATE-11,SYSDATE);
    --facturasp.mod_fecha(cod_factura,SYSDATE-10);
    --facturasp.mod_descri(cod_factura,'Factura de prueba 1 modificada');
    --facturasp.alta_factura(cod_factura, SYSDATE,'Factura de prueba 1');
    --TOTAL := facturasp.total_factura(100);
    --DBMS_OUTPUT.PUT_LINE('Total Facturas: '||TOTAL_F);
    --DBMS_OUTPUT.PUT_LINE('Total cobros: '||TOTAL_FP);
END;
/
SELECT * FROM facturas;
SELECT * FROM control_log;



set serveroutput on
DECLARE
    COD_FACTURA NUMBER;
    COD_PRODUCTO NUMBER;
    FECHA DATE := SYSDATE-3;
    UNIDADES NUMBER;
    LINEAS NUMBER;
BEGIN
    cod_factura:=1;
    cod_producto:=4;
    unidades:=1;
    lineas_facturasp.baja_linea(cod_factura,cod_producto);
    --LINEAS:=lineas_facturasp.num_lineas(cod_factura);
    --lineas_facturasp.mod_producto(cod_factura, cod_producto, FECHA);
    --lineas_facturasp.alta_linea(cod_factura,cod_producto,unidades,fecha);
    --DBMS_OUTPUT.PUT_LINE('Cantidad de lineas factura: '||lineas);
END;
/
SELECT * FROM lineas_factura;
SELECT * FROM productos;
--UPDATE productos SET total_vendidos=0;
SELECT * FROM control_log ORDER BY FECHA DESC;