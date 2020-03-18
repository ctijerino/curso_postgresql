select * from film

select
	film_id,
	title,
	(case
	 	when length < 30 then 'Corta'
	 	when length > 50 then 'Mediana' else 'Largo'
	end) as length
	from film