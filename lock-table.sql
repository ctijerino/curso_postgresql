--Consola1
begin;
lock table clientes;

insert o delete o update
rollback o commit

--Consola2
select * from clientes;
--Esta consulta no se ejecutará mientras no se confirme (descarte) la 
-- transacciòn en consola1