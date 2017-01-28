
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
DBMS_OUTPUT.PUT_LINE('HOLA BUENAS NOCHES ' ||mensaje);
END;
/

--ejecutamos el procedimiento

exec saludar (' fernando velazquez');

--generamos la secuencia

CREATE SEQUENCE SEC_PERSONA
START WITH 1 --EMPEZAR EN 
INCREMENT BY 1 -- INCREMENTAR EN 
NOMAXVALUE; --NO TIENE LIMITE SUPERIOR MILLONES DE REGISTROS

--GENERAMOS LA TABLA
CREATE TABLE PERSONA(ID_PERSONA INTEGER,
NOMBRE VARCHAR2(20), EDAD INTEGER,
CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));

CREATE OR REPLACE PROCEDURE guardar_persona(my_id OUT integer, my_nombre IN varchar2, my_edad IN integer)
AS
BEGIN
select sec_persona.nextval INTO my_id from DUAL; --UN CURSOS ES UN JOIN SE UNA LA SECUENCIA PERSONA Y SU TABLA PERSONA 
insert into persona values(my_id,my_nombre,my_edad);
END;
/

declare
valor integer;
begin
guardar_persona(valor,'fernando',20);
end;
/
select *from persona;



