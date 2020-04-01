--Consola1
begin isolation level read committed;

--Esta transacciòn leerà de otras transacciones siempre y cuando estèn confirmadas
select * from clientes;  --Incluirá el registro de la consola2 porque ya fue confirmado

rollback;


--Consola2
insert into clientes (nombre,salario) values ('Juana Lopez',150);




---------------------
--Consola1
begin isolation level read serializable;
--Esta transacción NO LEERÁ ningún dato que cambió en otra transacción luego de iniciada dicha transacción 

--La inserciòn de Juana Pèrez no serà visible desde esta transacciòn hasta que sea terminada (commit o rollback)

--consola2
insert into clientes (nombre,salario) values ('Juana Perez',10);
