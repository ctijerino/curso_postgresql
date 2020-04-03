create table pgweb (
	id serial not null primary key,
	title varchar(50) not null,
	body text
);

insert into pgweb (title,body) values
	('Título 1','Mis Vecinos son como amigos'),
	('Título 2','Viaje al Centro de la tierra'),
	('Título 3','Un amigo es como un hermano');
select * from pgweb;

select * from pgweb where
	to_tsvector('english',body) @@ to_tsquery('english','amigo');

select to_tsvector('english',body),to_tsquery('english','amigo'),body,'Inglès'
	from pgweb
union all
select to_tsvector(body),to_tsquery('amigo'),body,'Español'
	from pgweb
union all
select to_tsvector('arabic',body),to_tsquery('arabic','amigo'),body,'arabic'
	from pgweb

insert into pgweb (title,body) values ('Tìtulo 4','Los perros son amigables');

select to_tsvector(body),to_tsquery('amigo'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigo');
	
insert into pgweb (title,body) values ('Tìtulo 5','El perro es el mejor amigo del hombre y el hombre no es amigo de los murcièlagos');
insert into pgweb (title,body) values ('Tìtulo 6','Tengo dolor de amígdalas'), ('7','Tengo amigdalìtis');
insert into pgweb (title,body) values ('8','Nicaragua y Cuba jugaron un partido amistoso');

select to_tsvector(body),to_tsquery('amistad'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amistad');

select to_tsvector(body),to_tsquery('amigable'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigable');

insert into pgweb (title,body) values ('Tìtulo 9','Tengo dolor de amigdalas')

select to_tsvector(body),to_tsquery('amígdala'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amígdala');
	
select to_tsvector(body),to_tsquery('amigdala'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigdala');


--Ìndices
alter table pgweb 
	add column busqueda_en tsvector
		GENERATED ALWAYS AS (to_tsvector('english',coalesce(title,'') || ' ' || coalesce(body,''))) STORED
		
create index text_search_en on pgweb using gin (busqueda_en);

alter table pgweb 
	add column busqueda_es tsvector
		GENERATED ALWAYS AS (to_tsvector('spanish',coalesce(title,'') || ' ' || coalesce(body,''))) STORED
		
create index text_search_es on pgweb using gin (busqueda_es);
select * from pgweb


insert into pgweb (title,body) values ('La Creación','Moisés tomó las tablas');
select * from pgweb

select * from pgweb where
	to_tsvector(title || ' ' || body) @@ to_tsquery('creación & tabla');


create table pgweb (
	id serial not null primary key,
	title varchar(50) not null,
	body text
);

insert into pgweb (title,body) values
	('Título 1','Mis Vecinos son como amigos'),
	('Título 2','Viaje al Centro de la tierra'),
	('Título 3','Un amigo es como un hermano');
select * from pgweb;

select * from pgweb where
	to_tsvector('english',body) @@ to_tsquery('english','amigo');

select to_tsvector('english',body),to_tsquery('english','amigo'),body,'Inglès'
	from pgweb
union all
select to_tsvector(body),to_tsquery('amigo'),body,'Español'
	from pgweb
union all
select to_tsvector('arabic',body),to_tsquery('arabic','amigo'),body,'arabic'
	from pgweb

insert into pgweb (title,body) values ('Tìtulo 4','Los perros son amigables');

select to_tsvector(body),to_tsquery('amigo'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigo');
	
insert into pgweb (title,body) values ('Tìtulo 5','El perro es el mejor amigo del hombre y el hombre no es amigo de los murcièlagos');
insert into pgweb (title,body) values ('Tìtulo 6','Tengo dolor de amígdalas'), ('7','Tengo amigdalìtis');
insert into pgweb (title,body) values ('8','Nicaragua y Cuba jugaron un partido amistoso');

select to_tsvector(body),to_tsquery('amistad'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amistad');

select to_tsvector(body),to_tsquery('amigable'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigable');

insert into pgweb (title,body) values ('Tìtulo 9','Tengo dolor de amigdalas')

select to_tsvector(body),to_tsquery('amígdala'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amígdala');
	
select to_tsvector(body),to_tsquery('amigdala'),body from pgweb where
	to_tsvector(body) @@ to_tsquery('amigdala');


--Ìndices
alter table pgweb 
	add column busqueda_en tsvector
		GENERATED ALWAYS AS (to_tsvector('english',coalesce(title,'') || ' ' || coalesce(body,''))) STORED
		
create index text_search_en on pgweb using gin (busqueda_en);

alter table pgweb 
	add column busqueda_es tsvector
		GENERATED ALWAYS AS (to_tsvector('spanish',coalesce(title,'') || ' ' || coalesce(body,''))) STORED
		
create index text_search_es on pgweb using gin (busqueda_es);
select * from pgweb


insert into pgweb (title,body) values ('La Creación','Moisés tomó las tablas');
select * from pgweb

select * from pgweb where
	to_tsvector(title || ' ' || body) @@ to_tsquery('creación & tabla');

--alter table pgweb drop column idioma;

alter table pgweb 
	add column idioma regconfig default 'spanish';

alter table pgweb 
	add column busqueda2_multi tsvector
		GENERATED ALWAYS AS (to_tsvector(idioma,coalesce(title,'') || ' ' || coalesce(body,''))) STORED

alter table pgweb drop column busqueda2_es;

select * from pgweb

insert into pgweb (title,body,idioma) values 
	('Creation','This article teachs how work with table','english'),
	('Creation','This article teachs how work with table','spanish');

select * from pgweb order by id desc
"'articl':3 'creation':1 'how':5 'tabl':8 'teachs':4 'this':2 'with':7 'work':6"
"'articl':3 'creation':1 'tabl':8 'teach':4 'work':6"
update pgweb set idioma='english' where id=12
select * from pgweb order by id desc

select * from pgweb where
	busqueda2_multi @@ to_tsquery(idioma,'creación & tabla');

update pgweb set title='Create' where id=12

select to_tsquery(idioma,'create & table'),busqueda2_multi from pgweb where
	busqueda2_multi @@ to_tsquery(idioma,'create & table');

select title,body from pgweb where
	busqueda2_multi @@ to_tsquery(idioma,'create & table');
	
select title,body from pgweb where
	busqueda2_multi @@ to_tsquery(idioma,'creación & tabla');
	
	