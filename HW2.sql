-- 1.Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);

drop table employees;

drop table salary;

drop table employee_salary

drop table roles

drop table roles_employee


-- 2. Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values  
		('Alec'),
		('Alden'),
		('Alvin'),
		('Aidan'),
		('Archer'),
		('Arlen'),
		('Alton'),
		('Aloysius'),
		('Axel'),
		('Alaric'),
		('Basil'),
		('Bryce'),
		('Brendan'),
		('Bennett'),
		('Brayden'),
		('Beau'),
		('Blaise'),
		('Bram'),
		('Bjorn'),
		('Caden'),
		('Carter'),
		('Callum'),
		('Colin'),
		('Conrad'),
		('Cyrus'),
		('Cillian'),
		('Calvin'),
		('Camden'),
		('Cassius'),
		('Dante'),
		('Damian'),
		('Darian'),
		('Declan'),
		('Derrick'),
		('Darian'),
		('Dennis'),
		('Donovan'),
		('Darryl'),
		('Dawson'),
		('Darian'),
		('Ethan'),
		('Elias'),
		('Ezra'),
		('Emery'),
		('Everett'),
		('Enzo'),
		('Eamon'),
		('Eldon'),
		('Erick'),
		('Felix'),
		('Finn'),
		('Forrest'),
		('Franklin'),
		('Frederick'),
		('Gavin'),
		('Gage'),
		('Grayson'),
		('Grant'),
		('Graham'),
		('Gabriel'),
		('Garrison'),
		('Garrett'),
		('Gideon'),
		('Gerald'),
		('Harrison'),
		('Hudson'),
		('Hayden'),
		('Harlan'),
		('Holden'),
		('Henry');


select * from employees;	
	
-- 3.Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4.Наполнить таблицу salary 16 строками:
insert into salary (monthly_salary)
values  
		(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

select * from salary;
	
-- 5.Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null 
);

select * from employee_salary;

-- 6.Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values  
		(3, 7),
		(1, 4),
		(5, 9),
		(40, 13),
		(23, 4),
		(11, 2),
		(52, 10),
		(15, 13),
		(26, 4),
		(16, 1),
		(33, 7),
		(12, 4),
		(13, 3),
		(14, 2),
		(42, 1),
		(2, 15),
		(17, 14),
		(18, 13),
		(19, 12),
		(20, 11),
		(21, 10),
		(22, 9),
		(4, 8),
		(24, 7),
		(25, 6),
		(6, 5),
		(27, 4),
		(28, 3),
		(29, 2),
		(71, 1),
		(72, 15),
		(73, 14),
		(74, 13),
		(75, 12),
		(76, 11),
		(77, 10),
		(78, 9),
		(79, 8),
		(80, 7),
		(7, 6);
	
select * from employee_salary;

-- 7.Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles (
	id serial primary key,
	role_name int not null unique
);

select * from roles;

-- 8.Поменять тип столба role_name с int на varchar(30)
ALTER TABLE roles
ALTER COLUMN role_name TYPE varchar(30);

select * from roles;

-- 9.Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Desinger'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
	
select * from roles;

-- 10.Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	foreign key (employee_id)
		references employees(id),
	role_id int not null,	
	foreign key (role_id)
		references roles(id)
);

select * from roles_employee;

-- 11.Наполнить таблицу roles_employee 40 строками:
insert into roles_employee(employee_id, role_id)
values  (7, 2),
		(20, 4),
		(3, 9),
		(5, 13),
		(23, 4),
		(11, 2),
		(10, 9),
		(22, 13),
		(21, 3),
		(34, 4),
		(6, 7),
		(44, 12),
		(16, 1),
		(30, 7),
		(50, 14),
		(27, 3),
		(8, 10),
		(17, 15),
		(55, 2),
		(65, 8),
		(42, 8),
		(13, 6),
		(25, 9),
		(18, 10),
		(37, 8),
		(51, 10),
		(68, 10),
		(46, 10),
		(2, 20),
		(9, 4),
		(24, 19),
		(49, 6),
		(63, 18),
		(52, 6),
		(15, 11);



