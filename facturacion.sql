create table marca(
	codmarca serial not null primary key,
	descripcion varchar(50) not null unique
)

create table producto(
	codproducto serial not null primary key,
	descripcion  varchar(100) not null unique,
	codmarca int not null references marca(codmarca)
)

create table facturaenc(
	nofactura serial not null primary key,
	fecha date not null default now()::date
)

create table facturadet(
	nodet serial not null primary key,
	nofactura int not null references facturaenc(nofactura),
	codproducto int not null references producto(codproducto),
	cantidad int not null,
	precio numeric(14,2) not null
)

create table clientes(
	codcliente serial not null primary key,
	nombres varchar(200) not null,
	cedula varchar(14) not null unique
)

alter table facturaenc drop column codcliente;
alter table facturaenc add column codcliente int;
alter table facturaenc alter column codcliente set not null;
alter table facturaenc add constraint fk_clientes 
	foreign key (codcliente) references clientes(codcliente)

alter table facturaenc rename constraint fk_clientesssss to fk_clientes
alter table facturaenc drop constraint fk_cliente

--Esta linea se agregó 20200310-Actualizado