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