--Drop table Fact_Enc;
create table Fact_Enc (
	NoFactura serial not null primary key,
	fecha date not null default now()
);

create table Fact_Det (
	NoDet serial not null primary key,
	NoFact_id int not null,
	CodProducto int not null,
	Cantidad int not null,
	Precio numeric not null,
	Total numeric not null,
	foreign key (NoFact_id) references Fact_Enc(NoFactura)
);

create table Producto (
	CodProducto serial not null primary key,
	Descripcion varchar(200) not null,
	CodMarca_id int not null,
	foreign key (CodMarca_id) references Marca(CodMarca)
);

Create table Marca (
	CodMarca serial not null primary key,
	Descripcion varchar(200) not null
);

SELECT * FROM Marca;
INSERT INTO Marca(Descripcion) VALUES ('ALPINA');
INSERT INTO Marca(Descripcion) VALUES ('ESKIMO');

SELECT * FROM Producto;
INSERT INTO Producto(Descripcion,CodMarca_id) VALUES ('AGUA BOTELLA 710ML','1');
INSERT INTO Producto(Descripcion,CodMarca_id) VALUES ('AGUA BOTELLA 1L','1');
INSERT INTO Producto(Descripcion,CodMarca_id) VALUES ('LECHE DESCREMADA 0% GRASA','2');
INSERT INTO Producto(Descripcion,CodMarca_id) VALUES ('CREMA ACIDA BOLSA 454GR','2');

