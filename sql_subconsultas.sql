select distinct r.customer_id
	from rental as r
	left join payment as p on r.rental_id=p.rental_id
	
select * from customer
	where customer_id not in (
		select distinct  r.customer_id
			from rental as r
			left join payment as p on r.rental_id=p.rental_id
		    where p.rental_id is null
	)
