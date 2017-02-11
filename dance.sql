SET SERVEROUTPUT ON;
--creamos la tabla dance
create table dance( id_dance integer, nombre varchar2(20), edad integer,
constraint pk_id_dance PRIMARY KEY(id_dance));

--generar los siguientes registros
insert into dance values(1,'juan',16);
insert into dance values(2,'pedro',20);
insert into dance values(3,'luis',45);
insert into dance values(4,'Jose',70);
select *from dance;

declare 
estatus varchar2(20); 
cursor cur1 is select * from dance; --declaracion del cursor 
BEGIN 
For rec in cur1 LOOP 
if rec.edad<18 THEN 
estatus:='precoz';
dbms_output.put_line( 'nombre: ' ||  rec.nombre  || ' edad: ' || rec.edad || ' estatus: ' || estatus );
ELSE
estatus:='viejo';
dbms_output.put_line( ' nombre: ' || rec.nombre || ' edad: ' || rec.edad || ' estatus: ' ||estatus);
END if;
END LOOP;
END;
/
