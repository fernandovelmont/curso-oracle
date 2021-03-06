set SERVEROUTPUT ON;
CREATE TABLE TRABAJADOR(SEGURO_SOCIAL INTEGER, 
                        NOMBRE VARCHAR2(25),
                        EDAD INTEGER,
                 CONSTRAINT PK_TRABAJADOR PRIMARY KEY(SEGURO_SOCIAL));
                 
                 CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO_SOCIAL INTEGER, SUELDO_BASE FLOAT, HORAS_LABORADAS INTEGER, FECHA_PAGO DATE, 
CONSTRAINT PK_ID_NOMINA PRIMARY KEY (ID_NOMINA),
CONSTRAINT FK1_SEGURO_SOCIAL FOREIGN KEY (SEGURO_SOCIAL)
REFERENCES TRABAJADOR(SEGURO_SOCIAL));

CREATE SEQUENCE SEC_NOMINA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;



CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID_NOMINA OUT INTEGER, 
              MY_SEGURO_SOCIAL IN INTEGER, MY_SUELDO_BASE IN FLOAT)
              AS
              BEGIN
              SELECT SEC_NOMINA.NEXTVAL INTO MY_ID_NOMINA FROM DUAL;
              INSERT INTO NOMINA(ID_NOMINA,SEGURO_SOCIAL,SUELDO_BASE)
              VALUES (MY_ID_NOMINA, MY_SEGURO_SOCIAL, MY_SUELDO_BASE);
              END;
              /
              


CREATE OR REPLACE PROCEDURE GENERAR_TRABAJADOR(MY_SEGURO_SOCIAL IN INTEGER, MY_NOMBRE IN VARCHAR2,MY_EDAD IN INTEGER, MY_ID_NOMINA OUT INTEGER, MY_SUELDO_BASE IN FLOAT)
AS
BEGIN
INSERT INTO TRABAJADOR VALUES(MY_SEGURO_SOCIAL, MY_NOMBRE, MY_EDAD);
GUARDAR_NOMINA(MY_ID_NOMINA, MY_SEGURO_SOCIAL, MY_SUELDO_BASE);
END;
/


DECLARE
VALOR INTEGER;
BEGIN
GENERAR_TRABAJADOR(1,'ANA',28,VALOR,6000);
GENERAR_TRABAJADOR(2,'PEDRO',40,VALOR,8000);
GENERAR_TRABAJADOR(3,'JUAN',35,VALOR,7000);
GENERAR_TRABAJADOR(4,'KARLA',41,VALOR,10000);

END;
/
SELECT *FROM TRABAJADOR;
