select 'a fat cat sat on a mat and ate fat rat'::tsvector @@ 'cat & rat'::tsquery;
 
select 'a fat cat sat on a mat and ate fat'::tsvector @@ 'cat | rat'::tsquery;

select 1,to_tsvector('fat cats ate fat rats'), to_tsquery('fat & rat'),'spanish'
union
select 2,to_tsvector('english','fat cats ate fat rats'), to_tsquery('english','fat & rat'),'english'

select to_tsvector ('fat cats ate fat rats') @@ to_tsquery('fat & rat');
select to_tsvector ('english','fat cats ate fat rats') @@ to_tsquery('english','fat & rat');

select to_tsvector ('error   fatal') @@ to_tsquery('error <-> fatal');

select to_tsvector ('error no es fatal') @@ to_tsquery('error <-> fatal');

select true where 'el error   fatal' ilike '%error fatal%';

select phraseto_tsquery('cats   are   rats')

