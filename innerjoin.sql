--Primer Inner Join
select customer.customer_id,customer.first_name,customer.last_name,
	payment.amount
	from customer 
	inner join payment on customer.customer_id=payment.customer_id

--Alias a las tablas
select c.customer_id,c.first_name,c.last_name,
	p.amount
	from public.customer as c
	inner join payment as p on c.customer_id=p.customer_id
	
--Alias a los campos
select c.customer_id as Id ,c.first_name as nombres,c.last_name as apellidos,
	p.amount as monto
	from customer as c
	inner join payment as p on c.customer_id=p.customer_id
	
--Inner Join Where
select c.customer_id as Id ,c.first_name as nombres,c.last_name as apellidos,
	p.amount as monto
	from customer as c
	inner join payment as p on c.customer_id=p.customer_id
	where c.customer_id = 354
	
--Inner Join Where y Order
select c.customer_id as Id ,c.first_name as nombres,c.last_name as apellidos,
	p.amount as monto
	from customer as c
	inner join payment as p on c.customer_id=p.customer_id
	where c.customer_id = 354 order by p.amount DESC
	