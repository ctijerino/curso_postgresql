-- Se crea la tabla Marca, la descripcion no debe repetirse
create table marca (
	marcaid serial not null primary key,
	descripcion varchar(100) not null unique
);

-- Se crea la tabla de Productos, contener campo para el código de barra y no permita que se repita
-- Relacion Marcas->Productos

create table productos(
	productoid serial not null primary key,
	marcaid int not null,
	descripcion varchar(100) not null,
	codigo_barra varchar(20) not null unique,
	constraint pk_marca foreign key (marcaid) references marca(marcaid)
);

-- Se crea la tabla Proveedores
create table proveedores (
	proveedorid serial not null primary key,
	nombre_completo varchar(100) not null,
	identificacion varchar(50) not null unique
);

-- Se crea la tabla Encabezado_Compra, relacion Proveedor->Encabezado_Compra
create table encabezado_compra (
	compraid serial not null primary key,
	concepto varchar(200) not null,
	fecha	date not null default now(),
	proveedorid int not null,
	constraint pk_proveedor foreign key (proveedorid) references proveedores(proveedorid)
);

-- Se crea la tabla Detalle_Compra no permitir cantidades negativas, 
-- relaciones Encabezado_Compras->Detalle_Compra  y  Producto->Detalle_Compra
create table detalle_compra(
	detalleid serial not null primary key,
	compraid int not null,
	productoid int not null,
	cantidad numeric(14,2) default 0 check (total>=0),
	precio numeric(14,2) not null,
	total numeric (14,2) default 0 not null,
	constraint pk_compra foreign key (compraid) references encabezado_compra(compraid),
	constraint pk_producto foreign key (productoid) references productos(productoid)
);

-- Crear índices en todas las tablas
create index idx_marcas on marca(descripcion);
create index idx_productos on productos(descripcion);
create index idx_proveedores on proveedores(nombre_completo);
create index idx_compras on encabezado_compra(proveedorid);
create index idx_detalle_compras on detalle_compra (compraid,productoid);

-- Insertar Registros
select * from marca;
insert into marca(descripcion) values ('HP'), ('DELL'), ('LG'), ('SAMSUNG');

select * from productos;
insert into productos(marcaid,descripcion,codigo_barra) values (1,'computadora','123456789'), (2,'laptop','987654321');

-- Comprando codigo de barra unico
insert into productos(marcaid,descripcion,codigo_barra) values (3,'monitor','123456789');

--ERROR:  duplicate key value violates unique constraint "productos_codigo_barra_key"
--DETAIL:  Key (codigo_barra)=(123456789) already exists.
--SQL state: 23505
