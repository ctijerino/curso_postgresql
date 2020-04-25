-- Crear Base de Datos
create database	tarea_trigger;

-- Crear Tabla empleados
create table empleados(
	id_empleado	serial primary key,
	nombres varchar(100),
	apellidos varchar(100),
	fecha_ingreso date not null,
	estado integer default 1 -- 1:Activo, 0:Inactivo
);

-- Crear Esquema Auditoria
create schema auditoria;

-- Crear Tabla Esquema Auditoria Empleados
drop table auditoria.empleado;

create table auditoria.empleado(
	id serial primary key,
	tipo_movimiento varchar(10),
	fecha_cambio date not null,
	id_empleado integer not null,
	nombres varchar(100),
	apellidos varchar(100),
	fecha_ingreso date not null,
	estado integer
);

-- Crear Trigger
create or replace function auditoria.trigger_empleados()
	returns trigger as
  		$BODY$
	begin
		if TG_OP = 'DELETE' THEN
			insert into auditoria.empleado(tipo_movimiento, fecha_cambio, id_empleado, nombres, apellidos, fecha_ingreso, estado)
			values (TG_OP,NOW(),OLD.id_empleado, OLD.nombres, OLD.apellidos, OLD.fecha_ingreso, OLD.estado);

		else
			insert into auditoria.empleado(tipo_movimiento, fecha_cambio, id_empleado, nombres, apellidos, fecha_ingreso, estado)
			values (TG_OP,NOW(),NEW.id_empleado, NEW.nombres, NEW.apellidos, NEW.fecha_ingreso, NEW.estado);

		end if;

	return new;
	end;
	$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;

-- Llamado al Trigger;
create trigger empleado_trigger
	before insert or update or delete
	on public.empleados
  	for each row
 	execute procedure auditoria.trigger_empleados();
	
-- Pruebas varias de funcionamiento del Trigger
select * from empleados;
select * from auditoria.empleado;

insert into empleados(nombres, apellidos, fecha_ingreso, estado) values('carmen','tijerino',now(),1);
insert into empleados(nombres, apellidos, fecha_ingreso, estado) values('martha','jarquin',now(),1);	
insert into empleados(nombres, apellidos, fecha_ingreso, estado) values('jose','perez',now(),1);	

update empleados set nombres = 'carmen isabel' where id_empleado = 2;

delete from empleados where id_empleado = 3;


