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
	a.postal_code as codigo_postal,	a.phone as telefono, m.amount as pago
	from customer as c
	inner join address as a on c.address_id = a.address_id
	inner join city as t on a.city_id = t.city_id
	inner join country as p on t.country_id = p.country_id
	inner join payment as m on c.customer_id = m.customer_id
	where c.active = 1 order by pais,ciudad,nombres,apellidos,direccion_1

select * from public.customer where activebool

select * from public.customer where active<> 1
update public.customer set activebool=false where active<>1

-- UNIR CATEGORY, FILM_CATEGORY, FILM Y LANGUAJE
select f.title as titulo, f.description as descripcion, l.name as lenguage, 
	f.rating as clasificacion, c.name as categoria, a.first_name as nombre, a.last_name as apellido
	from public.film as f
	inner join language as l on l.language_id = f.language_id
	inner join film_category as fc on fc.film_id = f.film_id
	inner join category as c on c.category_id = fc.category_id
	inner join film_actor as fa on fa.film_id = f.film_id
	inner join actor as a on a.actor_id = fa.actor_id
	where f.rating = 'R' and f.rental_rate between 0.5 and 3.0  and first_name='Matthew' and last_name='Carrey'

-- UNIR FILM e INVENTARIO
select f.film_id as Cod_Film, f.title as titulo, i.inventory_id
	from public.film as f
	left join inventory as i on i.film_id = f.film_id
	where i.inventory_id is null
	
-- UNIR FILM e INVENTARIO
select f.film_id as Cod_Film, f.title as titulo, i.inventory_id
	from public.film as f
	right join inventory as i on i.film_id = f.film_id
	where f.film_id is null

-- UNIR CUSTOMER Y RENTAL (cuales clientes no han rentado)
select c.customer_id as Id, c.first_name as nombres, c.last_name as apellidos 
	from customer as c
	left join rental as r on r.customer_id = c.customer_id
	where r.rental_id is null
-- UNIR CUSTOMER Y RENTAL (cuales clientes no han pagado)
select c.customer_id as Id, c.first_name as nombres, c.last_name as apellidos 
	from customer as c
	left join payment as p on p.customer_id = c.customer_id
	where p.payment_id is null

-- UNIR CUSTOMER Y RENTAL (cuales clientes que rentan y no han pagado)
select r.*
	from rental as r
	left join payment as p on r.rental_id = p.rental_id
	where p.rental_id is null

select c.customer_id as Id, c.first_name as nombres, c.last_name as apellidos 
	from customer as c
	left join rental as r on r.customer_id = c.customer_id
	left join payment as p on p.customer_id = c.customer_id
	where r.rental_id  null

select c.first_name || ' ' || c.last_name as nombrecliente, r.rental_date, r.return_date
	from rental as r
	left join payment as p on p.rental_id = r.rental_id
	inner join customer as c on c.customer_id = r.customer_id
	where p.rental_id is null order by nombrecliente