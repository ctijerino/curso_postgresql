EXPLAIN 
select * from tblventas_detalle where "CANTIDAD" between 4 and 18

"Seq Scan on tblventas_detalle  (cost=0.00..62115.24 rows=431743 width=53)"
"Bitmap Heap Scan on tblventas_detalle  (cost=9169.22..41088.53 rows=431687 width=53)"

CREATE INDEX idx_vta_cant on tblventas_detalle("CANTIDAD")

EXPLAIN
select * from address where phone = '223664661973';

"Seq Scan on address  (cost=0.00..15.54 rows=1 width=61)"
 "Filter: ((phone)::text = '223664661973'::text)"
  "90 MSEG"
 
 CREATE INDEX idx_address_ph on address(phone);
 
 "Index Scan using idx_address_ph on address  (cost=0.28..8.29 rows=1 width=61)"
  "Index Cond: ((phone)::text = '223664661973'::text)""
  
 select * from actor where first_name = 'John'
 create index actor_fn_idx on actor(first_name)
 
 EXPLAIN SELECT * FROM ACTOR WHERE first_name='John'
 
 drop index if exists actor_fn_idx
 
SELECT * FROM TBLVENTAS_DETALLE
"Seq Scan on tblventas_detalle  (cost=0.00..49891.49 rows=2444749 width=53)"

EXPLAIN SELECT * FROM TBLVENTAS_DETALLE WHERE "COD_PROD"= 'P000013';
"Gather  (cost=1000.00..39213.47 rows=364 width=53)
  Workers Planned: 2
  ->  Parallel Seq Scan on tblventas_detalle  (cost=0.00..38177.07 rows=152 width=53)
          Filter: (("COD_PROD")::text = 'P000013'::text)"

CREATE INDEX TBLVTA_DET_IDX ON TBLVENTAS_DETALLE("COD_PROD")
"Bitmap Heap Scan on tblventas_detalle  (cost=11.25..1334.26 rows=364 width=53)"
"  Recheck Cond: (("COD_PROD")::text = 'P000013'::text)"
"  ->  Bitmap Index Scan on tblvta_det_idx  (cost=0.00..11.16 rows=364 width=0)"
"        Index Cond: (("COD_PROD")::text = 'P000013'::text)"

--Ver lista de filtraos de todas las tablas
SELECT tablename,indexname,indexdef
	FROM pg_indexes
	WHERE schemaname = 'public'
	ORDER BY tablename,indexname;

-- ver lista de filtros de una tabla especìfica	
SELECT indexname, indexdef
	from pg_indexes
	where tablename = 'address'
