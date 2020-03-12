--Primer Inner Join
select customer.customer_id, customer.first_name, customer.last_name, payment.amount
	from customer
	inner join payment on customer.customer_id = payment.customer_id
	
--Alias a las tablas
select c.customer_id, c.first_name, c.last_name, p.amount
	from public.customer as c
	inner join payment as p on c.customer_id = p.customer_id
	
--Alias a los campos
select c.customer_id, c.first_name, c.last_name, p.amount
	from customer as c
	inner join payment as p on c.customer_id = p.customer_id
	
--Inner Join where
select c.customer_id as Id, c.first_name, c.last_name, p.amount
	from customer as c
	inner join payment as p on c.customer_id = p.customer_id
	where c.customer_id = 354

--Inner Join where y Order
select c.customer_id as Id, c.first_name as nombres, c.last_name as apellidos, p.amount
	from customer as c
	inner join payment as p on c.customer_id = p.customer_id
	where c.customer_id = 354 order by p.amount DESC

-- UNIR CLIENTES Y DIRECCIONES
select c.customer_id as Id, c.first_name as nombres, c.last_name as apellidos, c.email as correo, p.country as pais,
	t.city as ciudad, a.address as direccion_1, a.address2 as direccion_2, a.district as distrito, 
	a.postal_code as codigo_postal,	a.phone as telefono
	from customer as c
	inner join address as a on c.address_id = a.address_id
	inner join city as t on a.city_id = t.city_id
	inner join country as p on t.country_id = p.country_id
	where c.active = 1 order by pais,ciudad,nombres,apellidos,direccion_1