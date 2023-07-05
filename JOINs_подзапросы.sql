create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)

drop table phones_apple

drop table phones_samsung

insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 10, 700),
    ('SE2020', 6, 8, 700),
    ('X65', 6, 10, 350),
    ('X75', 8, 10, 450),
    ('X85', 4, 16, 550),
    ('X95', 12, 10, 650),
    ('X105', 8, 12, 760),
    ('X115', 6, 10, 820)
 ;
 
create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)



insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850)
 ;
 
insert into phones_samsung(model, ram, front_camera, price)
values ('A65', 6, 10, 350),
    ('A75', 8, 10, 450),
    ('A85', 4, 16, 550),
    ('A95', 12, 10, 650),
    ('A105', 8, 12, 760),
    ('A115', 6, 10, 820)
 ;
 
create table samsung_orders(
 id serial primary key,
 phone_id int
)

create table apple_orders(
 id serial primary key,
 phone_id int
)



insert into apple_orders(phone_id)
values (3),
    (9),
    (5),
    (1),
    (4);
   
insert into samsung_orders(phone_id)
values (2),
    (1),
    (5);
    
select * from samsung_orders;
select * from apple_orders;
select * from phones_apple;
select * from phones_samsung; 

-- подзапросы 
select * from phones_apple
where price in (1500, 400); 

select * from phones_apple
where price > (select avg(price) from phones_samsung);

select * from phones_apple
where price in (select price from phones_samsung where price < 1000);

select price from phones_samsung where price < 1000

select * from phones_apple
where price not in (select price from phones_samsung where price < 1000);

select price from phones_samsung where price < 700

-- больше максимального числа / больше всего (select price from phones_samsung where price < 700) дороже 650 
select * from phones_apple
where price > all (select price from phones_samsung where price < 700)
order by price;

--больше минимального // 300
select * from phones_apple
where price > any (select price from phones_samsung where price < 700)
order by price;

--меньше максимального
select * from phones_apple
where price < any (select price from phones_samsung where price < 700)
order by price;

--цена не равна ни одной цене из таблицы "phones_samsung", которая меньше 700
select * from phones_apple
where price <> any (select price from phones_samsung where price < 700)
order by price;


-- Установить условие выборки строк, где цена не равна цене любого телефона из таблицы "phones_samsung" с ценой менее 700. 
select * from phones_apple
where price <> all (select price from phones_samsung where price < 700)
order by price;















create table City (
	id serial, 
	title varchar(50)
);


create table Person (
	id serial, 
	person_name varchar(50),
	city_id int 
)


select * from Person;


insert into City(title)
values  ('Berlin'),
		('Tokio'),
		('Antaliya'),
		('Paris'),
	    ('Roma');
	   
insert into Person(person_name, city_id)
values  ('Victor', 1),
		('Elena', 2),
		('Anna', 1),
		('Vadim', 3),
	    ('Ivan', 7),
 		('Irina', 9);
 		
-- внутренее объединение результатом выдачи таблиц будут только те данные. которые совпали по этой строчке 

select p.person_name, p.city_id, c.title, c.id
from Person as p
inner join city as c 
on p.city_id = c.id;

 drop table City 
 
 drop table Person
 
 
--строки иннера потом остатки из левой таблицы которые не попали в иннер джоин
select p.person_name, p.city_id, c.title, c.id
from Person as p
left join city as c 
on p.city_id = c.id;
 

select p.person_name, p.city_id, c.title, c.id
from Person as p
right join city as c 
on p.city_id = c.id;

-- иннер - > остатки из правой таблицы -> остатки из левой таблицы
select p.person_name, p.city_id, c.title, c.id
from Person as p
full outer join city as c 
on p.city_id = c.id;


-- 
select person.person_name, person.city_id, city.title, city.id
from Person 
cross join city
 