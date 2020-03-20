create database usocte

create table productos(
	codprod_id int not null primary key,
	nombre varchar(50) not null
);

SELECT * FROM productos;
INSERT INTO productos(codprod_id,nombre) VALUES ('1','Mandarina');
INSERT INTO productos(codprod_id,nombre) VALUES ('2','Agua');
INSERT INTO productos(codprod_id,nombre) VALUES ('3','Laptop');
INSERT INTO productos(codprod_id,nombre) VALUES ('4','TV');
INSERT INTO productos(codprod_id,nombre) VALUES ('5','Celular');

Drop table productos;

create table compras(
	codcomp_id serial not null primary key,
	cantidad int not null,
	precio int not null,
	codprod_id int not null,
	foreign key (codprod_id) references productos(codprod_id)
);

SELECT * FROM compras;
INSERT INTO compras(cantidad,precio,codprod_id) VALUES ('30','75','1');
INSERT INTO compras(cantidad,precio,codprod_id) VALUES ('375','3750','2');
INSERT INTO compras(cantidad,precio,codprod_id) VALUES ('1','3064','3');
INSERT INTO compras(cantidad,precio,codprod_id) VALUES ('3','40322','4');

create table ventas(
	codventa_id serial not null primary key,
	cantidad int not null,
	precio int not null,
	codprod_id int not null,
	foreign key (codprod_id) references productos(codprod_id)
);

SELECT * FROM ventas;
INSERT INTO ventas(cantidad,precio,codprod_id) VALUES ('25','30','1');
INSERT INTO ventas(cantidad,precio,codprod_id) VALUES ('200','2000','2');
INSERT INTO ventas(cantidad,precio,codprod_id) VALUES ('5','25000','3');
INSERT INTO ventas(cantidad,precio,codprod_id) VALUES ('1','50000','4');

select p.codprod_id, p.nombre, sum(c.precio*c.cantidad) as totalcompra, sum(v.precio*v.cantidad) as totalventa
	from productos p
	left join compras c on c.codprod_id = p.codprod_id
	left join ventas v on v.codprod_id = p.codprod_id
	group by p.codprod_id, p.nombre
	order by p.codprod_id
																			
with compras(p_id,total) as (
	select codprod_id, sum(precio*cantidad) from compras group by codprod_id
), ventas(p_id,total) as (
	select codprod_id, sum(cantidad*precio) from ventas group by codprod_id
)
	select 
	p.codprod_id, p.nombre, c.total as compras, v.total as ventas
	from productos as p
	left join compras as c on c.p_id=p.codprod_id
	left join ventas as v on v.p_id=p.codprod_id

with compras(p_id,total_cmp) as (
	select codprod_id, sum(precio*cantidad) from compras group by codprod_id
), ventas(p_id,total_vta) as (
	select codprod_id, sum(cantidad*precio) from ventas group by codprod_id
), total_cmp(total) as (
	select sum(total_cmp) from compras
)
	select 
	p.codprod_id, p.nombre, c.total_cmp as compras, v.total_vta as ventas
	from productos as p
	left join compras as c on c.p_id=p.codprod_id
	left join ventas as v on v.p_id=p.codprod_id
union all
	select null, 'Total Compras', tc.total, null from total_cmp as tc

create table productos_2(
	codprod_id serial not null primary key,
	nombre varchar(50) not null
);

drop table productos_log

create table productos_log(
	id int,
	nombre varchar(50),
	fecha_cambio timestamp default now()
);

SELECT * FROM productos_2;
INSERT INTO productos_2(codprod_id,nombre) VALUES ('1','Mandarina');
INSERT INTO productos_2(codprod_id,nombre) VALUES ('2','Agua');
INSERT INTO productos_2(codprod_id,nombre) VALUES ('3','Laptop');
INSERT INTO productos_2(codprod_id,nombre) VALUES ('4','TV');
INSERT INTO productos_2(codprod_id,nombre) VALUES ('5','Celular');

insert into productos_2 (nombre) values
('Mandarina'),('Agua'),('Laptop'),('TV'),('Celular');

select * from productos_2;
select * from productos_2 where nombre ilike '%v'

with prod_elim as (
	delete from productos_2 where nombre ilike '%lar'
	returning *
)
insert into productos_log (id,nombre)
select * from prod_elim

select * from productos_log
select * from productos_2 where nombre ilike '%lar'


alter table productos_2 add column precio numeric(14,2) default 0;
select * from productos_2

with t as (
	update productos_2 set precio = (codprod_id*1.15) + precio
	returning *
)
--select * from producto_2
select * from t

alter table productos_log add column tipo varchar(10);
alter table productos_log add column precio numeric(14,2) default 0;
select * from productos_log

select * from productos_2

-- Eliminar y actulizar tabla bitacora
with prod_eliminar as (
	delete from productos_2 where nombre ilike '%top'
	returning *
)
insert into productos_log (id,nombre,tipo,precio)
select codprod_id, nombre, 'delete', precio  from prod_eliminar

--Modificar y actualizar tabla bitacora
with prod_modificar as (
	update productos_2 set precio = (codprod_id*1.15) + precio
	returning *
)
insert into productos_log (id,nombre,tipo,precio)
select codprod_id, nombre, 'update', precio  from productos_2
	where codprod_id in (select codprod_id from prod_modificar)

select * from productos_log

--Insertar y actualizar bitacora
update productos_log set tipo ='update' where nombre ='TV'

with prod_insertar as (
	insert into public.productos_2(nombre, precio) values ('Gaseosa', 12.5)
	returning *
)
insert into productos_log (id,nombre,tipo,precio)
select codprod_id, nombre, 'insert', precio  from prod_insertar



