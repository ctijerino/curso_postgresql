create table instructores (
	id serial not null primary key,
	nombres varchar(50) not null,
	cedula varchar(14) unique,
	constraint ck_nombre_no_jose CHECK (nombres<>'JOSE')
);

--drop table instructores

INSERT INTO instructores(nombres, cedula) VALUES ('PEDRO','0010607680054Q');

SELECT * FROM instructores;

INSERT INTO instructores(nombres, cedula) VALUES ('JUAN','0010607680054Q');
INSERT INTO instructores(nombres, cedula) VALUES ('JUAN','0010607680055Q');
INSERT INTO instructores(nombres, cedula) VALUES ('JOSE','0010607680056Q');
	
UPDATE instructores SET nombres ='JOSE' WHERE id='3';

create table instructores (
	id serial not null primary key,
	nombres varchar(50) not null,
	cedula varchar(14) unique,
	constraint ck_nombre_no_jose CHECK (nombres<>'JOSE')
);

Create table cursos ( 
	id serial not null primary key, 
	instructor_id int not null, 
	nombre varchar(50) not null,
	foreign key (instructor_id)references instructores (id),
	constraint ck_instructor_id unique (instructor_id, nombre)
);

INSERT INTO cursos(instructor_id,nombre) VALUES ('1','CONTABILIDAD');
INSERT INTO cursos(instructor_id,nombre) VALUES ('1','ADMINISTRACION');
INSERT INTO cursos(instructor_id,nombre) VALUES ('3','ADMINISTRACION');

SELECT * FROM cursos;

Create table lab ( 
	id serial not null, 
	curso_id int not null, 
	nombre varchar(50) not null,
	primary key (id),
	foreign key (curso_id) references cursos(id)
);

Create table lab2 ( 
	id serial not null, 
	nombre varchar(50) not null,
	primary key (id)
);

Drop Table lab2_detalle;

Create table lab2_detalle ( 
	id serial not null primary key, 
	curso_id int not null,
	lab2_id int not null unique,
	foreign key (curso_id)references cursos (id),
	foreign key (lab2_id)references lab(id),
	--constraint lab_id unique (lab2_id)
);

SELECT * FROM lab2;
INSERT INTO lab2(nombre) VALUES ('laboratorio_1');
INSERT INTO lab2(nombre) VALUES ('laboratorio_2');

INSERT INTO lab2_detalle(curso_id,lab2_id) VALUES ('1','1');

ALTER TABLE instructores ADD COLUMN estado BOOLEAN DEFAULT true;
ALTER TABLE instructores ADD COLUMN fecha_creado DATE DEFAULT now();
ALTER TABLE instructores DROP COLUMN fecha_creado;
ALTER TABLE instructores RENAME COLUMN estado TO b_estado;
ALTER TABLE instructores ALTER COLUMN nombres SET DEFAULT '';
ALTER TABLE instructores ALTER COLUMN nombres DROP DEFAULT;
select * from instructores;
select * from cursos;
insert into cursos(instructor_id,nombre) values (1,'PostgreSQL');
insert into cursos(instructor_id,nombre) values (1,'Python');
insert into cursos(instructor_id,nombre) values (3,'PHP');
insert into cursos(instructor_id,nombre) values (3,'GIT');
insert into cursos(instructor_id,nombre) values (3,'Excel');

ALTER TABLE instructores add column telefono varchar (8);
ALTER TABLE instructores add column direccion text;
ALTER TABLE instructores add column correo varchar (50);

ALTER TABLE instructores ALTER COLUMN correo TYPE varchar (200);

