CREATE TABLE producto_2(
	id serial not null primary key,
	nombre varchar(50) not null
);

create table producto_log(
	id int,
	nombre varchar(50),
	fecha_cambio timestamp default now()
);

insert into producto_2 (nombre) values
('Mandarina'),('Agua'),('Laptop'),('TV'),('Celular');
select * from producto_2;
select * from producto_2 where nombre ilike '%v'

with prod_elim as (
	delete from producto_2 where nombre ilike '%lar'
	returning *
)
insert into producto_log (id,nombre)
select * from prod_elim

select * from producto_log
select * from producto_2 where nombre ilike '%lar'


alter table producto_2 add column precio numeric(14,2) default 0;
select * from producto_2
with t as (
	update producto_2 set precio = (id*1.15) + precio
	returning *
)
--select * from producto_2
select * from t

----Agregar al log, el tipo y el precio
alter table producto_log add column precio numeric(14,2) default 0;
alter table producto_log add column tipo char(1) default '';

with prod_elim as (
	delete from producto_2 where nombre ilike '%lar'
	returning *
)
insert into producto_log (id,nombre,precio,tipo)
select id,nombre,precio,'B' from prod_elim

select * from producto_log
---Actualizar
with t as (
	update producto_2 set precio = (id*1.15) + precio
	--update producto_2 set nombre='Portatiles' where id=3
	returning *
)
insert into producto_log (id,nombre,precio,tipo)
select id,nombre,precio,'A' from producto_2
	where id in (select id from t)

select * from producto_2
select * from producto_log order by 3 desc



