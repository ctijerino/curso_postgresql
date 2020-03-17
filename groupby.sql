select customer_id from payment group by customer_id;
select customer_id,sum(amount) as monto from payment group by customer_id;
select customer_id,max(amount) from payment group by customer_id 
	order by max(amount) desc;
select customer_id,staff_id,sum(amount) from payment group by customer_id,staff_id

select date(payment_date),count(amount) as monto
	from payment
	group by date(payment_date)

select * from payment


