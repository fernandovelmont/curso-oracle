CREATE TABLE TRABAJADOR(SEGURO_SOCIAL INTEGER, 
                        NOMBRE VARCHAR2(80), 
                        PATERNO VARCHAR(80),
              CONSTRAINT PK_TRABAJADOR PRIMARY KEY(SEGURO_SOCIAL));
              
              --CREAMOS LA SECUENCIA PARA LA NOMINA
              
              CREATE SEQUENCE SEC_NOMINA
              START WITH 1
              INCREMENT BY 1
              NOMAXVALUE;
              
              --CREAMOS LA SEGUNDA TABLA
              
              CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO_SOCIAL INTEGER, HORAS_LABORADAS INTEGER, FECHA_PAGO DATE, SALDO FLOAT,
              CONSTRAINT PK_ID_NOMINA PRIMARY KEY (ID_NOMINA),
              CONSTRAINT FK1_SEGURO_SOCIAL FOREIGN KEY (SEGURO_SOCIAL)
              REFERENCES TRABAJADOR(SEGURO_SOCIAL));
              
              --PROCEDIMIENTO PARA GUARDAR TRABAJADOR
              
              CREATE OR REPLACE PROCEDURE GUARDAR_TRABAJADOR(MY_ID IN INTEGER, 
              MY_NOMBRE IN VARCHAR2, MY_PATERNO IN VARCHAR2) AS
              BEGIN
              INSERT INTO TRABAJADOR VALUES(MY_ID,MY_NOMBRE,MY_PATERNO);
              END;
              /
              
              delete FROM NOMINA;
              SELECT *FROM TRABAJADOR;
              SELECT *FROM NOMINA;
              
              
              
              CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID_NOMINA OUT INTEGER,
              MY_SEGURO_SOCIAL IN INTEGER) AS
              BEGIN
              SELECT SEC_NOMINA.NEXTVAL INTO MY_ID_NOMINA FROM  DUAL;
              INSERT INTO NOMINA(ID_NOMINA,SEGURO_SOCIAL)VALUES(MY_ID_NOMINA,MY_SEGURO_SOCIAL);
              END;
               /
               
               DECLARE
               VALOR INTEGER;
               BEGIN
               GUARDAR_TRABAJADOR(333,'juan','campos');
              GUARDAR_NOMINA(VALOR,333);
              END;
              /
              SELECT *FROM TRABAJADOR;
                 
