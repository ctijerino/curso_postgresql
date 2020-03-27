EXPLAIN SELECT 
	CUSTOMER_ID,FIRST_NAME,LAST_NAME
FROM CUSTOMER 
WHERE
	LAST_NAME='Purdy'
	
EXPLAIN
SELECT 
	CUSTOMER_ID,FIRST_NAME,LAST_NAME
FROM CUSTOMER 
WHERE
	LOWER(LAST_NAME)='purdy'
	
CREATE INDEX idx_cust_lower_las_name ON customer(LOWER(last_name))

select 
  tablename,
  indexname,
  indexdef
from pg_indexes
where tablename='customer'


reindex database dvdrental
reindex table customer
