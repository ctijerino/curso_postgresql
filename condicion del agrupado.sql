select customer_id , sum(amount)
	from public.payment
	group by customer_id
	having sum(amount)>200;

select customer_id , sum(amount)
	from public.payment
	group by customer_id
	having count(amount)<10;

select payment_date, count(amount) as monto
	from payment
	group by payment_date --14365
	having count(amount)>1 --51
	
select * from payment
	where payment_date = '2007-04-29 23:36:32.996577'--14365
	
select * from (
	select payment_date, count(amount) as grp
		from payment
		group by payment_date
) grupo
	where grupo.grp>1
	
