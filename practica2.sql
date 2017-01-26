
set serveroutput on;
--RECAPITULANDO LO QUE ES UN BLOQUE PL SQL

DECLARE
nombre varchar2(20):='Fernando Daniel';

BEGIN 
DBMS_OUTPUT.PUT_LINE('BUENAS NOCHES '||nombre);
END;
/



DECLARE
edad INTEGER:=20;
dias INTEGER;
estatus VARCHAR2(12);
BEGIN
dias:=edad*365;

if dias >10000 then
estatus:= 'viejo';
else
estatus:='joven';
END IF;
DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES  '||dias||' ESTATUS: ' || estatus);
END;
/


--VEREMOS NUESTRO PRIMER PROCEDIMIENTO ALMACENADO 
CREATE OR REPLACE PROCEDURE SALUDAR(mensaje IN varchar2)
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('HOLA BUENAS NOCHES' || mensaje);
END;
/
