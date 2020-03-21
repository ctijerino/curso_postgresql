


-- drop database if exists pedidos;

-- create database pedidos;

create table empleados(
	empleadoid int not null,
	nombre varchar(30) null,
	apellido varchar(30) null,
	fecha_nac date null,
	reporta_a int null,
	extension int null,
	constraint pk_empleados primary key (empleadoid)
);

create table proveedores(
	proveedorid int not null,
	nombreprov varchar(50) not null,
	contacto varchar(50) not null,
	celuprov varchar(12) null,
	fijoprov varchar(12) null,
	constraint pk_proveedores primary key(proveedorid ) 
);

create table categorias(
	categoriaid int not null,
	nombrecat varchar(50) not null,
	constraint pk_categorias primary key (categoriaid) 
);

create table clientes(
	clienteid int not null,
	cedula_ruc varchar(10) not null,
	nombrecia varchar(30) not null,
	nombrecontacto varchar(50) not null,
	direccioncli varchar(50) not null,
	fax varchar(12) null,
	email varchar(50) null,
	celular varchar(12) null,
	fijo varchar(12) null,
	constraint pk_clientes primary key (clienteid)
);

create table ordenes(
	ordenid int not null,
	empleadoid int not null,
	clienteid int not null,
	fechaorden date not null,
	descuento int null,
	constraint pk_ordenes primary key (ordenid)
);


create table detalle_ordenes(
	ordenid int not null,
	detalleid int not null,
	productoid int not null,
	cantidad int not null,
	constraint pk_detalle_ordenes primary key(ordenid,detalleid ) 
);

create table productos(
	productoid int not null,
	proveedorid int not null,
	categoriaid int not null,
	descripcion varchar(50) null,
	preciounit numeric not null,
	existencia int not null,
	constraint pk_productos primary key(productoid )
) ;

alter table ordenes add constraint fk_ordenes_clien_ord_clientes foreign key(clienteid) references clientes (clienteid) on delete restrict on update restrict;

alter table ordenes add constraint fk_ordenes_emple_ord_empleado foreign key(empleadoid) references empleados (empleadoid) on delete restrict on update restrict;

alter table detalle_ordenes add constraint fk_detalle__orden_det_ordenes foreign key(ordenid) references ordenes (ordenid) on delete restrict on update restrict;

alter table detalle_ordenes add constraint fk_detalle__prod_deta_producto foreign key(productoid) references productos (productoid) on delete restrict on update restrict;

alter table productos add constraint fk_producto_cate_prod_categori foreign key(categoriaid) references categorias (categoriaid) on delete restrict on update restrict;

alter table productos add constraint fk_producto_prov_prod_proveedo foreign key(proveedorid) references proveedores (proveedorid) on delete restrict on update restrict;

alter table empleados add constraint fk_empleado_reporta foreign key(reporta_a) references empleados (empleadoid) on delete restrict on update restrict;

insert into categorias (categoriaid, nombrecat) values (100, 'carnicos');
insert into categorias (categoriaid, nombrecat) values (200, 'lacteos');
insert into categorias (categoriaid, nombrecat) values (300, 'limpieza');
insert into categorias (categoriaid, nombrecat) values (400, 'higine personal');
insert into categorias (categoriaid, nombrecat) values (500, 'medicinas');
insert into categorias (categoriaid, nombrecat) values (600, 'cosmeticos');
insert into categorias (categoriaid, nombrecat) values (700, 'revistas');

insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (10, 'don diego', 'manuel andrade', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (20, 'pronaca', 'juan perez', '0923434467','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (30, 'tony', 'jorge brito', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (40, 'miraflores', 'maria paz', '098124498','2458799');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (50, 'almay', 'pedro gonzalez', '097654567','2507190');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (60, 'revlon', 'monica salas', '099245678','2609876');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (70, 'yanbal', 'bety arias', '098124458','2450887');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (120, 'juris', 'manuel andrade', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (80, 'cleaner', 'manuel andrade', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (90, 'bayer', 'manuel andrade', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values (110, 'palmolive', 'manuel andrade', '099234567','2124456');

insert into productos values (1,10,100,'salchichas vienesas',2.60,200);
insert into productos values (2,10,100,'salami de ajo',3.60,300);
insert into productos values (3,10,100,'boton para asado',4.70,400);
insert into productos values (4,20,100,'salchichas de pollo',2.90,200);
insert into productos values (5,20,100,'jamon de pollo',2.80,100);
insert into productos values (6,30,200,'yogurt natural',4.30,80);
insert into productos values (7,30,200,'leche chocolate',1.60,90);
insert into productos values (8,40,200,'yogurt de sabores',1.60,200);
insert into productos values (9,40,200,'crema de leche',3.60,30);
insert into productos values (10,50,600,'base de maquillaje',14.70,40);
insert into productos values (11,50,600,'rimmel',12.90,20);
insert into productos values (13,60,600,'sombra de ojos',9.80,100);

insert into empleados values (1,'juan', 'cruz', '1967-01-18',null, 231);
insert into empleados values (2,'mario', 'sanchez', '1979-03-01',1,144);
insert into empleados values (3,'veronica', 'arias', '1977-06-22',1, 234);
insert into empleados values (4,'pablo', 'cely', '1977-01-28',2, 567);
insert into empleados values (5,'diego', 'andrade', '1970-05-15',2, 890);
insert into empleados values (6,'juan', 'andrade', '1976-11-17',3, 230);
insert into empleados values (7,'maria', 'noboa', '1979-12-21',3, 261);

insert into clientes values (1,'1890786576','supermercado estrella','juan alban','av.amazonas',null,null,null,null);
insert into clientes values (2,'1298765477','el rosado','maria cordero','av.ael inca',null,null,null,null);
insert into clientes values (3,'1009876567','distribuidora prensa','pedro pinto','el pinar',null,null,null,null);
insert into clientes values (4,'1876090006','su tienda','pablo ponce','av.amazonas',null,null,null,null);
insert into clientes values (5,'1893456776','supermercado dorado','lorena paz','av.6 diciembre',null,null,null,null);
insert into clientes values (6,'1678999891','mi comisariato','rosario utreras','av.amazonas',null,null,null,null);
insert into clientes values (7,'1244567888','supermercado descuento','leticia ortega','av.la prensa',null,null,null,null);
insert into clientes values (8,'1456799022','el descuento','juan torres','av.patria',null,null,null,null);
insert into clientes values (9,'1845677777','de luise','jorge parra','av.amazonas',null,null,null,null);
insert into clientes values (10,'183445667','yarbantrella','pablo polit','av.republica',null,null,null,null);

insert into ordenes values(1,3,4,'2007-06-17', 5);
insert into ordenes values(2,3,4,'2007-06-02', 10);
insert into ordenes values(3,4,5,'2007-06-05', 6);
insert into ordenes values(4,2,6,'2007-06-06', 2);
insert into ordenes values(5,2,7,'2007-06-09', null);
insert into ordenes values(6,4,5,'2007-06-12', 10);
insert into ordenes values(7,2,5,'2007-06-14', 10);
insert into ordenes values(8,3,2,'2007-06-13', 10);
insert into ordenes values(9,3,2,'2007-06-17', 3);
insert into ordenes values(10,2,2,'2007-06-18', 2);

insert into detalle_ordenes values(1,1,1,2);
insert into detalle_ordenes values(1,2,4,1);
insert into detalle_ordenes values(1,3,6,1);
insert into detalle_ordenes values(1,4,9,1);
insert into detalle_ordenes values(2,1,10,10);
insert into detalle_ordenes values(2,2,13,20);
insert into detalle_ordenes values(3,1,3,10);
insert into detalle_ordenes values(4,1,9,12);
insert into detalle_ordenes values(5,1,1,14);
insert into detalle_ordenes values(5,2,4,20);
insert into detalle_ordenes values(6,1,3,12);
insert into detalle_ordenes values(7,1,11,10);
insert into detalle_ordenes values(8,1,2,10);
insert into detalle_ordenes values(8,2,5,14);
insert into detalle_ordenes values(8,3,7,10);
insert into detalle_ordenes values(9,1,11,10);
insert into detalle_ordenes values(10,1,1,5);

