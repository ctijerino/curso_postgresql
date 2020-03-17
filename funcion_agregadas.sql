select 
	c.first_name as "Nombres",c.last_name as "Apellidos",
	(c.first_name || ' ' || c.last_name) as "Nombre Completo",
	r.rental_date as "Fecha Renta",r.return_date as "Fecha Devolución"
	from customer as c
	inner join rental as r on r.customer_id=c.customer_id
	left join payment as p on p.rental_id=r.rental_id
	where p.rental_id is null
	order by 1,2
	
select 
	c.first_name ,c.last_name ,
	/*r.rental_date,r.return_date*/
	COUNT(*) AS CONTEO
	from customer as c
	inner join rental as r on r.customer_id=c.customer_id
	left join payment as p on p.rental_id=r.rental_id
	where p.rental_id is null
	GROUP BY c.first_name,c.last_name







