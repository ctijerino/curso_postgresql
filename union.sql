select * from rental

select * into rental200505 from rental where return_date<='20050531'  --295
select * into rental200506 from rental where return_date::date between '20050601'::date and '20050630'::date  order by return_date desc --
select * into rental200507 from rental where return_date::date between '20050701'::date and '20050731'::date  order by return_date desc --
select * into rental200508 from rental where return_date::date between '20050801'::date and '20050831'::date  order by return_date desc --

select * into rental20050506 from rental where return_date::date between '20050515'::date and '20050615'::date  order by return_date desc --

select max(return_date),min(return_date) from rental20050506

select * from rental200505   --295
/*union 
select * from rental200506   --3071  --3366*/
union
select * from rental20050506  --1158

select * into rental200506 from rental where return_date::date between '20050601'::date and '20050630'::date  order by return_date desc --
select * into rental20050525 from rental where return_date::date between '20050525'::date and '20050525'::date  order by return_date desc --
select * into rental20050525_2 from rental where return_date::date='20050525' or return_date::date='20050601'   order by return_date limit 5

select * from rental20050525_2
except
select * from rental20050525

select * from payment order by payment_date

select * into payment_1 from payment 
	where customer_id=107 
	and payment_date::date between '20070220' and '20070228'
	
select * into payment_2 from payment 
	where customer_id=107 
	and payment_date::date between '20070220' and '20070310'

select * from payment_2
except
select * from payment_1

select * from payment_1
except
select * from payment_2


