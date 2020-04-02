--Consulta que presenta los idiomas
select cfgname from pg_catalog.pg_ts_config

create table pgweb(
  id serial not null primary key,
  title varchar(50) not null,
  body text
);

insert into pgweb(title,body)
	values
	('Título 1','Mis vecinos son como amigos'),
	('Título 2','Viaje al Centro de la Tierra'),
	('Título 3','Un amigo es como un hermano');
	
select title,body
from pgweb
where to_tsvector('english',body) @@ to_tsquery('english','amigo');

select to_tsvector('english',body),to_tsquery('english','amigo'),body,'Inglés'
	from pgweb
union all
select to_tsvector(body),to_tsquery('amigo'),body,'Español'
	from pgweb
union all
select to_tsvector('arabic',body),to_tsquery('arabic','amigo'),body,'arabic'
	from pgweb
	
insert into pgweb(title,body) values('Titulo 4','Los perros son amigables');
insert into pgweb(title,body) values('Titulo 5','El perro es el mejor amigo del hombre y el hombre no es amigo de los murcielagos');
insert into pgweb(title,body) values('Titulo 6','Tengo dolor de amigdalas');
insert into pgweb(title,body) values('Titulo 7','Tengo amigdalitis');
insert into pgweb(title,body) values('Titulo 8','Nicaragua y Cuba jugaron un partido amistoso');

select to_tsvector(body),to_tsquery('amigo'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigo');

create index pgweb_idx on pgweb using GIN
(to_tsvector('spanish',body));

alter table pgweb
	add column textserachable_index_col_ tsvector
		generated always as (to_tsvector('english',coalesce(title,'')|| ' ' || coalesce(body,''))) stored;

create index textserarch_idx on pgweb using GIN (textserachable_index_col_);

alter table pgweb
	add column busqueda_es tsvector
		generated always as (to_tsvector('spanish',coalesce(title,'')|| ' ' || coalesce(body,''))) stored;

create index textserarch_es on pgweb using GIN (busqueda_es);

insert into pgweb(title,body) values('La Creación','Moises tomó las tablas');
select * from pgweb

select title,body from pgweb where 
	to_tsvector(title || ' ' || body) @@ to_tsquery('creación & tabla');
	
	