--Задание 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами:
select employee_name, monthly_salary 
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id;
	

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary 
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
where s.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id 
	where employees.employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)


select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id 
	where salary.monthly_salary < 2000 and employees.employee_name is null;

--5. Найти всех работников кому не начислена ЗП.
select employee_name, salary_id 
from employees e 
left join employee_salary es 
	on e.id = es.employee_id 
where salary_id is null;

--вариант с 12 домашек
SELECT e. employee_name, s.monthly_salary FROM salary s
JOIN employee_salary es ON es.salary_id = s.id
RIGHT JOIN employees e ON es.employee_id=e.id
WHERE monthly_salary IS NULL;

-- 6. Вывести всех работников с названиями их должности.

select e.id, employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%QA%';


-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
from employees e
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Senior%';


--15. Вывести зарплаты Java разработчиков
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Java%';


--15. Вывести зарплаты Python разработчиков
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary, role_name 
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты  Middle JS разработчиков
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты  Senior Java разработчиков
select employee_name, monthly_salary, role_name
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Senior Java%';


--20. Вывести зарплаты Junior QA инженеров
select employee_name, monthly_salary 
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where role_name like '%Junior%QA %';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary) as avg_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like 'Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) as sum_salary
from roles_employee 
	join employees on roles_employee.employee_id = employees.id
	join roles on roles_employee.role_id = roles.id
	join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%JavaScript%';


--23. Вывести минимальную ЗП QA инженеров

SELECT MIN(salary.monthly_salary) as min_salary
from roles_employee 
	join employees on roles_employee.employee_id = employees.id
	join roles on roles_employee.role_id = roles.id
	join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

SELECT MAX(salary.monthly_salary) as min_salary
from roles_employee 
	join employees on roles_employee.employee_id = employees.id
	join roles on roles_employee.role_id = roles.id
	join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

-- 25. Вывести количество QA инженеров

SELECT COUNT(*) FROM roles r
JOIN roles_employee re ON re.role_id = r.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%QA%';


--26. Вывести количество Middle специалистов.
SELECT COUNT(*) FROM roles r
JOIN roles_employee re ON re.role_id = r.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%Middle%';


--27. Вывести количество разработчиков
SELECT COUNT(*) FROM roles r
JOIN roles_employee re ON re.role_id = r.id
JOIN employees e ON re.employee_id = e.id
where role_name like '%developer%'

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) as sum_salary
from roles_employee 
	join employees on roles_employee.employee_id = employees.id
	join roles on roles_employee.role_id = roles.id
	join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%developer%';

-- ????29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, s.monthly_salary
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
order by s.monthly_salary asc;


--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, s.monthly_salary
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where s.monthly_salary BETWEEN 1700 AND 2300
order by s.monthly_salary asc;



-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, s.monthly_salary
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where s.monthly_salary < 2300
order by s.monthly_salary asc;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, s.monthly_salary
from employees e
join employee_salary es 
	on e.id = es.employee_id 
join salary s 
	on es.salary_id = s.id
join roles_employee re 
	on e.id = re.employee_id 
join roles r
	on re.role_id = r.id 
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary asc;
