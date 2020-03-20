create table employees(
	employee_id serial primary key,
	full_name varchar not null,
	manager_id int
);

SELECT * FROM employees;

insert into employees(
	full_name,
	manager_id
)
values
	('Michael Nortj', NULL),
	('Megan Berry',1),
	('Sarah Berry',1),
	('Zoe Black',2),
	('Tim James',2),
	('Bella Tucker',3),
	('Ryan Metcalfe',3),
	('Max Mills',3),
	('Leonard Gray',4),
	('Ryan Henderson',7);

WITH RECURSIVE subordinates as (
	SELECT
		employee_id,
		manager_id,
		full_name
	FROM
		employees
	WHERE
		employee_id = 2
	UNION
		SELECT
			e.employee_id,
			e.manager_id,
			e.full_name
		FROM
			employees e
		INNER JOIN subordinates s ON s.employee_id = e.manager_id
) SELECT
	*
	FROM
		subordinates;
	