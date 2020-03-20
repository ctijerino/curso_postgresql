select 
	customer_id,
	sum(amount)
	from payment
	group by customer_id
	having sum(amount)>200;

select 
	customer_id,
	count(amount)
	from payment
	group by customer_id
	having count(amount)<10
	
select payment_date,count(amount) as monto
	from payment
	group by payment_date --14365
	having count(amount)<>1 --51

select * from payment --14596
	where payment_date = '2007-05-14 13:44:29.996577'
	
select * from (
	select payment_date,count(amount) as grp
		from payment
		group by payment_date 
	) grupo
	where grupo.grp>1
