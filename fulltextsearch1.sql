SELECT 1,to_tsvector('Amigos fat cats ate fat rats'),to_tsquery('fat & rat'), 'spanish'
union
SELECT 2,to_tsvector('english','Amigos fat cats ate fat rats'),to_tsquery('english','fat & rat'),'english'

SELECT to_tsvector('fat cats ate fat rats') @@ to_tsquery('fat & rat');
SELECT to_tsvector('english','fat cats ate fat rats') @@ to_tsquery('english','fat & rat');

SELECT 'fat cats ate fat rats'::tsvector @@ to_tsquery('fat & rat');

SELECT to_tsvector('fat cats ate fat rats'),to_tsquery('fat & rat');

SELECT to_tsvector('error   fatal') @@ to_tsquery('error <-> fatal');

SELECT to_tsvector('error no es fatal') @@ to_tsquery('error <-> fatal');

select true where 'el error  fatal' ilike '%error fatal%'
select phraseto_tsquery('cats   ate    rats')



