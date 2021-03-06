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

alter table pgweb
	add column idioma regconfig default 'spanish';

--alter table pgweb drop column idioma;
select * from pgweb

alter table pgweb
	add column busqueda2_multi tsvector
		generated always as (to_tsvector(idioma,coalesce(title,'') || ' ' || coalesce(body,''))) stored;
		
insert into pgweb (title,body,idioma) values
	('creation', 'This article teachs how work with table','english'),
	('creation', 'This article teachs how work with table','spanish');
update pgweb set idioma ='english' where id=11
select * from pgweb order by id desc
update pgweb set title ='Create' where id=11
select title, body from pgweb where 
	busqueda2_multi @@ to_tsquery(idioma,'create & table');
select title, body from pgweb where 
	busqueda2_multi @@ to_tsquery(idioma,'creación & table');

----------------
create table tv_series(
	id serial primary key,
	title text not null,
	description text not null,
	creator text not null
);

INSERT INTO tv_series(title,description, creator)
values 
('Stranger Things','Stranger Things is an American science fiction, drama-horror web television series created by the Duffer Brothers and released on Netflix...','Duffer Brothers'),
('Breaking Bad','Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan. The show aired on AMC from January 20, 2008, to September 29, 2013. It was set and filmed in Albuquerque, New Mexico, and tells the story of Walter White (Bryan Cranston), an underemployed and depressed high school chemistry teacher who is struggling with midlife crisis and a recent diagnosis of stage-three lung cancer...','Vince Gilligan'),
('Game of Throne','Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, George R. R. Martins series of fantasy novels, the first of which is A Game of Thrones. The show was both produced and filmed in Belfast and elsewhere in the United Kingdom. Filming locations also included Canada, Croatia, Iceland, Malta, Morocco, and Spain.[4] The series premiered on HBO in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.','George R. R. Martin'),
('Rick and Morty','Rick and Morty is an American adult animated science fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Networks late-night programming block Adult Swim. The series follows the misadventures of cynical mad scientist Rick Sanchez and his good-hearted but fretful grandson Morty Smith, who split their time between domestic life and interdimensional adventures.','Justin Roiland')

update tv_series set description = 'Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, George R. R. Martin''s series of fantasy novels, the first of which is A Game of Thrones. The show was both produced and filmed in Belfast and elsewhere in the United Kingdom. Filming locations also included Canada, Croatia, Iceland, Malta, Morocco, and Spain.[4] The series premiered on HBO in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.'
	where title='Game of Throne';

update tv_series set description = 'Rick and Morty is an American adult animated science fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Network''s late-night programming block Adult Swim. The series follows the misadventures of cynical mad scientist Rick Sanchez and his good-hearted but fretful grandson Morty Smith, who split their time between domestic life and interdimensional adventures.'
	where title='Rick and Morty';
	
INSERT INTO tv_series(title,description, creator)
values 
('Stranger Things','Stranger Things es una serie web estadounidense de suspenso y ciencia ficción coproducida y distribuida por Netflix','Duffer Brothers'),
('Breaking Bad','Breaking Bad es una serie de televisión dramática estadounidense creada y producida por Vince Gilligan. Breaking Bad narra la historia de Walter White (Bryan Cranston), un profesor de química con problemas económicos a quien le diagnostican un cáncer de pulmón inoperable. Para pagar su tratamiento y asegurar el futuro económico de su familia comienza a cocinar y vender metanfetamina,1​ junto con Jesse Pinkman (Aaron Paul), un antiguo alumno suyo. La serie, ambientada y producida en Albuquerque (Nuevo México), se caracteriza por poner a sus personajes en situaciones que aparentemente no tienen salida, lo que llevó a que su creador la describa como un wéstern contemporáneo.','Vince Gilligan'),
('Game of Throne','Game of Thrones —llamada Juego de Tronos en España— es una serie de televisión de drama y fantasía medieval creada por David Benioff y D. B. Weiss y producida por la cadena HBO. Su argumento está inspirado en la serie de novelas Canción de hielo y fuego, escrita por el estadounidense George R. R. Martin, y relata las vivencias de un grupo de personajes de distintas casas nobiliarias en el continente ficticio de Poniente para tener el control del Trono de Hierro y gobernar los siete reinos que conforman el territorio','George R. R. Martin'),
('Rick and Morty','Rick y Morty es una serie de televisión estadounidense de animación para adultos creada por Justin Roiland y Dan Harmon para Adult Swim. La serie sigue las desventuras de un científico, Rick, y su fácilmente influenciable nieto, Morty, quienes pasan el tiempo entre la vida doméstica y los viajes espaciales, temporales e intergalácticos. Roiland es el encargado de darle voz a los dos personajes principales, la serie también incluye las voces de Chris Parnell, Spencer Grammer, y Sarah Chalke.','Justin Roiland')

INSERT INTO tv_series(title,description, creator)
values
('Vikings','Vikings es una serie de televisión de drama histórico creada y escrita por Michael Hirst para el canal History. Filmada en Irlanda, se estrenó el 3 de marzo de 2013 en Canadá. En enero de 2019, se anunció que la sexta temporada de 20 episodios, que se ordenó el 12 de septiembre de 2017, antes del estreno en la quinta temporada, sería la última temporada de la serie. La sexta temporada se estrenó el 4 de diciembre de 2019. Una serie secuela, titulada Vikings: Valhalla, está en desarrollo para Netflix.','Michael Hirst'),
('Vikings','Vikings is a historical drama television series created and written by Michael Hirst for the History channel. Filmed in Ireland, it premiered on March 3, 2013, in Canada. In January 2019, it was announced that the 20-episode sixth season, which was ordered on September 12, 2017, ahead of its fifth-season premiere, would be the final season of the series. The sixth season premiered on December 4, 2019. A sequel series, titled Vikings: Valhalla, is in development for Netflix.','Michael Hirst')

alter table tv_series add idioma regconfig;
select * from tv_series order by id

update tv_series set idioma='english' where id in (1,2,3,4,10);
update tv_series set idioma='spanish' where idioma is null;

alter table tv_series add busqueda tsvector
	generated always as
	(to_tsvector(idioma,coalesce(title,'')|| ' ' || coalesce(description,'')|| ' ' || coalesce(creator,''))) stored;

select title, idioma from tv_series
	where busqueda @@ to_tsquery('drama')
	order by title

