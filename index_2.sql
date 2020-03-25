create table empleados(
	empleado_id serial primary key,
	nombre varchar(255) not null,
	apellido varchar(255) not null,
	correo varchar(255) unique
);

select tablename, indexname, indexdef
	from pg_indexes
	where tablename ='empleados';

Alter table empleados add telefono varchar(20);
create unique index idx_emp_tel on empleados(telefono)

insert into empleados(nombre,apellido,correo,telefono) values ('Pedro','Perez','pedro@uni.edu.ni',22664532)
insert into empleados(nombre,apellido,correo,telefono) values ('Juan','Lopez','pedro@uni.edu.ni',22664532) -- Error por duplicidad de correo
insert into empleados(nombre,apellido,correo,telefono) values ('Juan','Lopez','juan@uni.edu.ni',22664532) --  Error por duplicidad de telefono

alter table empleados add telefono_oficina varchar(20), add ext varchar(5);
create unique index idx_emp_tel_of_ext on empleados(telefono_oficina,ext)

insert into empleados(nombre,apellido,correo,telefono,telefono_oficina,ext) 
	values ('Juan','Perez','juanp@uni.edu.ni',123456,123456,110)
insert into empleados(nombre,apellido,correo,telefono,telefono_oficina,ext) 
	values ('Juan','Lopez','juan@uni.edu.ni',654321,123456,112)
insert into empleados(nombre,apellido,correo,telefono,telefono_oficina,ext) 
	values ('Pedro','Lopez','pedrol@uni.edu.ni',245654321,123456,112)
	
EXPLAIN SELECT
	CUSTOMER_ID, FIRST_NAME,LAST_NAME
FROM CUSTOMER
WHERE
	LAST_NAME='Purdy'

EXPLAIN SELECT
	CUSTOMER_ID, FIRST_NAME,LAST_NAME
FROM CUSTOMER
WHERE
	LOWER (LAST_NAME)='purdy'

CREATE INDEX idx_cust_lower_las_name on customer(LOWER(last_name))

select tablename, indexname, indexdef
	from pg_indexes
	where tablename ='customer';