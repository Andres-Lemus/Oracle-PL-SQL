   SET SERVEROUTPUT ON
   DECLARE
   json1 JSON_OBJECT_T;
   v1 varchar2(4000);
   BEGIN
   
   json1:=json_object_t.parse('{"nombre":"Alberto"}');
   dbms_output.put_line(json1.to_string);
  -- Poner contenido escalar
  json1.put('edad',29);
  json1.put('telefono','99999999');
  dbms_output.put_line(json1.to_string);
  
  -- Poner un documento anidado
  json1.put('direccion','{"calle":"pez","numero":5,"ciudad":"madrid"}');
  dbms_output.put_line(json1.to_string);
  json1.put('direccion',json_object_t('{"calle":"pez","numero":5,"ciudad":"madrid"}'));
  dbms_output.put_line(json1.to_string);

   -- Poner un array
  json1.put('experiencia',json_array_t('["excel","word","python","linux"]'));
  dbms_output.put_line(json1.to_string);
  
   -- Actualizar dato
  json1.put('edad',45);
  dbms_output.put_line(json1.to_string);
  
  -- Renombrar clave
  json1.rename_key('nombre','nombre_completo');
  dbms_output.put_line(json1.to_string);
  
  -- Eliminar un elemento
  json1.remove('telefono');
  
  dbms_output.put_line(json1.to_string);
  
   -- Recuperar valores concretos
   v1:=json1.get_string('nombre_completo');
   dbms_output.put_line(v1);
   
   -- Nos puede dar error de datos
   v1:=json1.get_number('nombre_completo');
   dbms_output.put_line(v1);
   
   -- debemos poner el tipo adecuado
   v1:=json1.get_number('edad');
   dbms_output.put_line(v1);
     
   v1:=json1.get_string('direccion');
   dbms_output.put_line(v1);
   
   -- PAra recuperar un subdocumento
   v1:=json1.get_object('direccion').get_String('calle');
   dbms_output.put_line(v1);
    
   -- Ver el número de elementos en el documento  
   v1:=json1.get_size;
   dbms_output.put_line(v1);
  END;