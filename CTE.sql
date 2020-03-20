select payment_date,count(amount) as monto
	from payment
	group by payment_date --14365
	having count(amount)<>1 --51

select * from (
	select payment_date,count(amount) as grp
		from payment
		group by payment_date 
	) grupo
	where grupo.grp>1
	
with fecha_duplicada as
(
	select payment_date,count(amount) as grp
		from payment
		group by payment_date 
)
select * from fecha_duplicada as f
	where f.grp<>1;
	

with cte_staff as (
select
	staff_id,
	count(rental_id) as conteo
	from rental
	group by staff_id
)
select s.staff_id,s.first_name,s.last_name,cs.conteo
	from staff s inner join cte_staff as cs on (s.staff_id=cs.staff_id)
	
with pago_cliente as (
select 
	r.customer_id,
	sum(p.amount) as pagado
	from rental as r
	inner join payment as p on r.rental_id=p.rental_id
	group by r.customer_id
)
select p.customer_id,c.first_name,c.last_name,p.pagado
	from customer c inner join pago_cliente p on c.customer_id=p.customer_id

with cte_payment_1 as (
select * from payment 
	where customer_id=107 
	and payment_date::date between '20070220' and '20070228'
),cte_payment_2 as(
select * from payment 
	where customer_id=107 
	and payment_date::date between '20070220' and '20070310'
)
select count(*) from cte_payment_1 union all select count(*) from cte_payment_2







