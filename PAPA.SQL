CREATE TABLE PAPA(ID INTEGER PRIMARY KEY , NOMBRE VARCHAR2(20), EDAD INTEGER);
CREATE TABLE HIJOMAYOR(ID INTEGER PRIMARY KEY , NOMBRE VARCHAR2(20), EDAD INTEGER);
CREATE TABLE HIJOMENOR(ID INTEGER PRIMARY KEY , NOMBRE VARCHAR2(20), EDAD INTEGER);


CREATE OR REPLACE TRIGGER DIS_PAPA AFTER INSERT ON PAPA FOR EACH ROW 
BEGIN 
IF :NEW.EDAD >18 THEN
INSERT INTO HIJOMAYOR VALUES(:NEW.ID , :NEW.NOMBRE, :NEW.EDAD );
ELSE 
INSERT INTO HIJOMENOR VALUES(:NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
END IF;
END;
/
INSERT INTO PAPA VALUES(1,'JUAN',23);
INSERT INTO PAPA VALUES(2,'ANA',15);
--HACEMOS UN SELECT EN PAPA 
SELECT *FROM PAPA;

SELECT * FROM HIJOMAYOR;
SELECT * FROM HIJOMENOR;
