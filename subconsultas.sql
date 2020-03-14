--crear subconsultas

select distinct r.customer_id
	from rental as r
	left join payment as p on r.rental_id = p.rental_id
	
select * from customer
	where customer_id in (184,87,477)
	
select * from customer
	where customer_id in (
		select distinct r.customer_id
			from rental as r
			left join payment as p on r.rental_id = p.rental_id
			where p.rental_id is null
	)
	
select * from customer
	where customer_id not in (
		select distinct r.customer_id
			from rental as r
			left join payment as p on r.rental_id = p.rental_id
			where p.rental_id is null
	)

select c.name
	from category as c
	
select f.title, f.description, f.rating
	from film as f
	where f.rating = 'R'

select c.name
	from category as c
	where in(
	select f.title, f.description, f.rating
	from film as f
	where f.rating = 'R'
	)


