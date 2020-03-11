--Primer Inner Join
select customer.customer_id, customer.first_name, customer.last_name, payment.amount
	from customer
	inner join payment on customer.customer_id = payment.customer_id
	
--Alias a las tablas
select c.customer_id, c.first_name, c.last_name, p.amount
	from customer as c
	inner join payment as p on c.customer_id = p.customer_id
	
--Alias a los campos
select c.customer_id, c.first_name, c.last_name, p.amount
	from customer as c
	inner join payment as p on c.customer_id = p.customer_id