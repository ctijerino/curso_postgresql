create table instructores(
	id serial not null primary key,
	nombres varchar(50) not null,
	cedula varchar(14) unique,
	constraint ck_nombre_no_jose CHECK (nombres<>'JOSE')
);

insert into instructores (nombres,cedula) values('PEDRO','00111111125');
insert into instructores (nombres,cedula) values('JOSE','00111111123');
select * from instructores;
--drop table instructores cascade
UPDATE INSTRUCTORES SET NOMBRES='JOSE' WHERE NOMBRES='JUAN'
