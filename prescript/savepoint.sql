begin;
create table mitabla(n int);
insert into mitabla values(1);

savepoint s1;
insert into mitabla values(2);
insert into mitabla values(3);

rollback;


begin;
create table mitabla(n int);
insert into mitabla values(1);

savepoint s1;
insert into mitabla values(2);
insert into mitabla values(3);

rollback to s1;


begin;
create table mitabla(n int);
insert into mitabla values(1);
savepoint s1;
insert into mitabla values(2);
insert into mitabla values(3);
savepoint s2;
insert into mitabla values(4);
savepoint s3; 
insert into mitabla values(5);
savepoint s4;  
insert into mitabla values(6);
insert into mitabla values(7);
--rollback to s1;
release savepoint s3;


begin;
insert into mitabla values(2);
savepoint s2;
insert into mitabla values(3);
select * from mitabla;
release savepoint s2;
rollback;

begin;
insert into mitabla values(2);
savepoint s2;
insert into mitabla values(3);
select * from mitabla;
commit to s1;