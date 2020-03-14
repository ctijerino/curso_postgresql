--FUNCION DE AGREGADO COUNT(*)
SELECT * 
	--COUNT(*)
	FROM CUSTOMER
	WHERE FIRST_NAME ILIKE 'A%'
	ORDER BY FIRST_NAME
	
select c.first_name || ' ' || c.last_name as nombrecliente,
	count(*) as CONTEO
	from rental as r
	left join payment as p on p.rental_id = r.rental_id
	inner join customer as c on c.customer_id = r.customer_id
	where p.rental_id is null group by nombrecliente
	
select 
	--c.first_name || ' ' || c.last_name as nombrecliente, 
	MIN(r.rental_date) as rentaantigua, MAX(r.rental_date) as rentareciente
	from rental as r
	left join payment as p on p.rental_id = r.rental_id
	inner join customer as c on c.customer_id = r.customer_id
	where p.rental_id is null 

select 
	c.first_name || ' ' || c.last_name as nombrecliente, 
	COUNT(*),
	MIN(r.rental_date) as rentaantigua, MAX(r.rental_date) as rentareciente
	from rental as r
	left join payment as p on p.rental_id = r.rental_id
	inner join customer as c on c.customer_id = r.customer_id
	where p.rental_id is null
	group by nombrecliente
	order by nombrecliente

select 
	--c.first_name || ' ' || c.last_name as nombrecliente, 
	ci.city as ciudad,
	COUNT(*),
	MIN(r.rental_date) as rentaantigua, MAX(r.rental_date) as rentareciente
	from rental as r
	left join payment as p on p.rental_id = r.rental_id
	inner join customer as c on c.customer_id = r.customer_id
	inner join address as a on a.address_id = c.address_id
	inner join city as ci on ci.city_id = a.city_id
	where p.rental_id is null
	group by ciudad
	order by ciudad
	
select a.first_name || ' ' || a.last_name as nombreactor,
	count(*)
	from public.film as f
	inner join film_actor as fa on fa.film_id = f.film_id
	inner join actor as a on a.actor_id = fa.actor_id
	group by nombreactor
	order by nombreactor
	
select f.title as nombrepelicula,
	count(*)
	from public.film as f
	inner join film_actor as fa on fa.film_id = f.film_id
	inner join actor as a on a.actor_id = fa.actor_id
	group by nombrepelicula
	order by nombrepelicula
