CREATE TABLE employee(
	employee_id serial not null primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email varchar(255) unique
)

select 
  tablename,
  indexname,
  indexdef
from pg_indexes
where tablename='employee'

ALTER TABLE EMPLOYEE ADD TELEFONO VARCHAR(20);
CREATE UNIQUE INDEX idx_emp_tel ON EMPLOYEE(TELEFONO)

INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Pedro','Perez','pedro@uni.edu.ni',22664532)
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Juan','Lopez','pedro@uni.edu.ni',22664532)  --FALLA
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Juan','Lopez','juan@uni.edu.ni',22664532)

ALTER TABLE EMPLOYEE ADD telefono_oficina varchar(20), ADD ext varchar(5);
CREATE UNIQUE INDEX idx_emp_tel_of_ext ON employee(telefono_oficina,ext)

INSERT INTO EMPLOYEE (first_name,last_name,email,telefono,telefono_oficina,ext)
	values ('Juan','Perez','juanp@uni.edu.ni','123456','123456','110')
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono,telefono_oficina,ext)
	values ('Juan','Lopez','juan@uni.edu.ni','654321','123456','112')
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono,telefono_oficina,ext)
	values ('Pedro','Lopez','pedrol@uni.edu.ni','254654321','123456','112')
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono,telefono_oficina,ext)
	values ('Pedro','Lopez','pedrol@uni.edu.ni','254654321','123456','111')
select * from employee
