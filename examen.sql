set serveroutput on;

create table hobbies(id_hobbie integer, nombre varchar2(10),
constraint pk_id_hobbie PRIMARY KEY(id_hobbie));

create sequence sec_hobbies
start with 1
increment by 1
nomaxvalue; 

create table direccion(id_direccion integer, calle varchar2(30), C_P integer, municipio varchar2(20), estado varchar2(20),
constraint pk_id_direccion PRIMARY KEY (id_direccion));

create sequence sec_direccion
start with 1
increment by 1
nomaxvalue;

create table usario(id_usuario integer, nombre varchar2(20), email varchar2(30), login varchar2(20), contraseña varchar2(20), hid_hobbie integer, did_direccion integer,
constraint pk_id_usuario primary key (id_usuario),
constraint fk1_hid_hobbie foreign key (hid_hobbie) references hobbies (id_hobbie),
constraint fk2_did_direccion foreign key(did_direccion) references direccion(id_direccion));

create sequence sec_usuario
start with 1
increment by 1
nomaxvalue;

create or replace procedure guardar_hobbies(my_id_hobbie out integer, my_nombre in varchar2)
as 
begin 
select sec_hobbies.nextval into my_id_hobbie from dual;
insert into hobbies(id_hobbie, nombre)
values(my_id_hobbie,my_nombre);
end;
/

create or replace procedure guardar_direccion(my_id_direccion out integer,my_calle in varchar2, my_C_P in  varchar2, my_municipio in varchar2, my_estado  in varchar2)
as
begin
select sec_direccion.nextval into my_id_direccion from dual;
insert into direccion(id_direccion,calle,C_P, municipio,estado)
values(my_id_direccion,my_calle, my_C_P , my_municipio , my_estado);
end;
/

create or replace procedure guardar_usuario(my_id_usuario out integer, my_nombre in varchar2,my_email in varchar2, my_login in varchar2, my_contraseña in varchar2, my_hid_hobbie in integer,
my_did_direccion in integer)
as
begin
select sec_usuario.nextval into my_id_usuario from dual;
insert into usario(id_usuario,nombre, email, login, contraseña, hid_hobbie , did_direccion)
values(my_id_usuario,my_nombre,my_email,my_login,my_contraseña,my_hid_hobbie,my_did_direccion);
end;
/
