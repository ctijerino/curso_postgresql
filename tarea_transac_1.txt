--Crear tabla de transacciones
create database tareatransac;
--Crear tabla clientes
create table clientes (
	id serial not null primary key,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	monto_cuenta numeric(14,2)
);
--Insertar registro en la tabla
insert into clientes(nombre,apellido,monto_cuenta) values ('Juan', 'Mayorga',1000);
insert into clientes(nombre,apellido,monto_cuenta) values ('Jose', 'Solis',500);
--Ver contenido de la tabla
select * from clientes;
--Realizar transaccion de envio de dinero de 200 cordobas del cliente Juan a Jose
Begin;
update clientes set monto_cuenta=monto_cuenta-200 where id=1;
update clientes set monto_cuenta=monto_cuenta+200 where id=2;
commit;
--Realizar transaccion y realizar rechazo de envio de dinero de 200 cordobas del cliente Juan a Jose
Begin;
update clientes set monto_cuenta=monto_cuenta-100 where id=1;
update clientes set monto_cuenta=monto_cuenta+100 where id=2;
rollback;

