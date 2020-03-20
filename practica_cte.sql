--create database practica_cte;
create table productos(
	id serial not null primary key,
	nombre varchar(50) not null
);
insert into productos (nombre) values
('Mandarina'),('Agua'),('Laptop'),('TV'),('Celular');
select * from productos;

create table compras(
	id serial not null primary key,
	producto_id int not null references productos(id),
	cant int default 0,
	precio numeric(14,2) default 0 not null,
	total numeric(14,2) GENERATED ALWAYS AS (cant * precio) STORED
);
insert into compras (producto_id,cant,precio) values 
	(1,10,5),(1,5,5),(2,100,15),(2,150,15),(3,2,13250.25),(4,1,44002.3)
select * from compras
create table ventas(
	id serial not null primary key,
	producto_id int not null references productos(id),
	cant int default 0,
	precio numeric(14,2) default 0 not null,
	total numeric(14,2) GENERATED ALWAYS AS (cant * precio) STORED
);
insert into ventas (producto_id,cant,precio) values 
	(1,50,20),(2,15,50),(4,1,55000)
select * from ventas

with cmp(pc_id,total_cmp) as (
	select producto_id,sum(cant*precio) from compras group by producto_id
),vta(pv_id,total_vta) as(
	select producto_id,sum(cant*precio) from ventas group by producto_id
),total_cmp(total) as (
	select sum(total_cmp) from cmp 
)
select 
	p.id,p.nombre,c.total_cmp as compras,v.total_vta as ventas
	from productos as p
	left join cmp as c on c.pc_id=p.id
	left join vta as v on v.pv_id=p.id
union all
	select null,'Total Compras',tc.total,null from total_cmp as tc










