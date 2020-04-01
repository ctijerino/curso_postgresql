create table pgweb (
id serial not null primary key,
title varchar(50) not null,
body text

);

insert into pgweb (title,body) 
	values 
	('Título 1','Mis vecinos son como amigos'),
	('Título 2','Viaje al Centro de la Tierra'),
	('Título 3','Un amigo es como un hermano');
	
	
SELECT title,body
FROM pgweb
WHERE to_tsvector('english', body) @@ to_tsquery('english', 'amigo');

SELECT title,body
FROM pgweb
WHERE to_tsvector('spanish', body) @@ to_tsquery('spanish', 'amigo');

insert into pgweb (title,body) values ('Título 4','Él muy amigablemente no fue tan amigable');


SELECT title,body
FROM pgweb
WHERE to_tsvector(body) @@ to_tsquery('amigo');



insert into pgweb (title,body) values ('La Creación y las tablas de los mandamientos','Moises fue un profeta de Dios, uso dos tablas');

SELECT title
FROM pgweb
WHERE to_tsvector(title || ' ' || body) @@ to_tsquery('creación & tabla')
ORDER BY 1 DESC
LIMIT 10;

CREATE INDEX pgweb_idx ON pgweb USING GIN (to_tsvector(config_name, body));
CREATE INDEX pgweb_idx ON pgweb USING GIN (to_tsvector('english', title || ' ' || body));

ALTER TABLE pgweb
    ADD COLUMN textsearchable_index_col tsvector
               GENERATED ALWAYS AS (to_tsvector('english', coalesce(title, '') || ' ' || coalesce(body, ''))) STORED;
			   
			   
CREATE INDEX textsearch_idx ON pgweb USING GIN (textsearchable_index_col);
