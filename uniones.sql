select * from rental

select * from rental where return_date <= '20050531'
select * from rental where return_date::date between '20050601' and '20050630'::date order by return_date desc
select * from rental where return_date::date between '20050701' and '20050731'::date order by return_date desc
select * from rental where return_date::date between '20050801' and '20050831'::date order by return_date desc

select * into rental200505 from rental where return_date <= '20050531' --295
select * into rental200506 from rental where return_date::date between '20050601' and '20050630'::date order by return_date desc --3071
select * into rental200507 from rental where return_date::date between '20050701' and '20050731'::date order by return_date desc --4188
select * into rental200508 from rental where return_date::date between '20050801' and '20050831'::date order by return_date desc --8145

select * into rental20050506 from rental where return_date::date between '20050515' and '20050615'::date order by return_date desc --1158

select * from rental200505 --295
union
select * from rental200506 --3071  --3366

select * from rental200505 --295
union all
select * from rental20050506 --1158   --1453

select extract(day from payment_date),
	count(*)
	from payment 
		where extract(month from payment_date) = '02'
	group by extract(day from payment_date)
	--order by payment_date desc

select * from payment
select * from payment where payment_date::date = '20070214' --27
select * from payment where payment_date::date = '20070215' --308
select * from payment where payment_date::date = '20070216' --282
select * from payment where payment_date::date between '20070214' and '20070215'::date order by payment_date desc --335
select * into payment_20070214_15 from payment where payment_date::date between '20070214' and '20070215'::date order by payment_date desc --335
select * from payment where payment_date::date between '20070215' and '20070216'::date order by payment_date desc --590
select * into payment_20070215_16 from payment where payment_date::date between '20070215' and '20070216'::date order by payment_date desc --590

select * from payment_20070214_15
intersect -- registro en comun en las dos tablas (dia 15)
select * from payment_20070215_16

select * from payment_20070214_15
except -- todo lo que esta en payment_20070214_15 y no esta en payment_20070215_16 (dia 14)
select * from payment_20070215_16