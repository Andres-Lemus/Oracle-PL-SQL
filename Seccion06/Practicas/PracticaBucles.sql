-- Punto #1
DECLARE
    i NUMBER := 0;
    j NUMBER := 0;
BEGIN
  <<parent>>
  LOOP
    i := i + 1;
    <<child>>
    LOOP
      EXIT parent WHEN (i > 10);
      EXIT child WHEN (j >= 10);
       j:=j+1;
        DBMS_OUTPUT.put_line(i||'x'||j||'='||(i*j));
    END LOOP child;
    j:=0;
  END LOOP parent;
END;

DECLARE
    i NUMBER := 0;
    j NUMBER := 0;
BEGIN
    WHILE i < 10 LOOP
        i := i + 1;
        WHILE j < 10 LOOP
             j:=j+1;
        DBMS_OUTPUT.put_line(i||'x'||j||'='||(i*j));
            EXIT WHEN j=10;
        END LOOP;
        j:=0;
        EXIT WHEN i=10;
    END LOOP;
END;

DECLARE
    i NUMBER := 0;
    j NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP 
        FOR j IN 1..10 LOOP 
           DBMS_OUTPUT.put_line(i||'x'||j||'='||(i*j));
        END LOOP;
        j:=0;
    END LOOP;
END;

-- Punto #2
DECLARE
    TEXTO VARCHAR2(100):='Soy una frase de prueba';
    REVES TEXTO%TYPE;
    LARGO NUMBER:=0;
    CONTAR NUMBER:=0;
BEGIN
    LARGO := LENGTH(TEXTO);
    WHILE LARGO > 0 LOOP
        REVES:=REVES||SUBSTR(TEXTO,LARGO,1);
        LARGO:=LARGO-1;
    END LOOP;
    DBMS_OUTPUT.put_line(REVES);
END;

-- Punto #3
DECLARE
    TEXTO VARCHAR2(100):='Soy una frase X de prueba';
    REVES TEXTO%TYPE;
    LARGO NUMBER:=0;
    CONTAR NUMBER:=0;
BEGIN
    LARGO := LENGTH(TEXTO);
    WHILE LARGO > 0 LOOP
        EXIT WHEN LOWER(SUBSTR(TEXTO,LARGO,1)) = 'x';
        REVES:=REVES||SUBSTR(TEXTO,LARGO,1);
        LARGO:=LARGO-1;
    END LOOP;
    DBMS_OUTPUT.put_line(REVES);
END;

-- Punto #4
DECLARE
    NOMBRE VARCHAR2(20):='Mauricio';
    LARGO NUMBER;
    ASTERISCOS NOMBRE%TYPE;
BEGIN
    LARGO:=LENGTH(NOMBRE);
    FOR i IN 1..LARGO LOOP
        ASTERISCOS:=ASTERISCOS||'*';
    END LOOP;
    DBMS_OUTPUT.put_line(ASTERISCOS);
END;

-- Punto #5
DECLARE
    inicio NUMBER;
    fin NUMBER;
BEGIN
    inicio:=1;
    fin:=40;
    DBMS_OUTPUT.put_line('Múltiplos de 4 entre ' || inicio || ' y ' || fin);
     FOR i IN inicio..fin LOOP
        IF MOD(i,4) = 0 THEN
          DBMS_OUTPUT.put_line(i);
        END IF;
    END LOOP;
END;