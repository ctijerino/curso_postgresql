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