/* SQL (Basic) Query solutions */

-- #1	Revising the Select Query I -- 
select *
from city
where (countrycode like '%USA%') and (population > 100000);


-- #2 Revising the Select Query II --
select *
from city
where (countrycode = 'USA') and (population > 120000);


-- #3 Select All -- 
select *
from city;


-- #4 Select By ID --
select *
from city
where id = 1661;


-- #5 Japanese Cities' Attributes --
select *
from city
where countrycode = 'JPN';


-- #6 Japanese Cities' Names --
select name
from city
where countrycode = 'JPN';


-- #7 Weather Observation Station 1 --
select city, state
from station;


-- #8 Weather Observation Station 3 -- 
select distinct city
from station
where mod(id,2) = 0;


-- #9 Weather Observation Station 4 --
select (count(city)-count(distinct city)) as difference
from station;


-- #10 Weather Observation Station 6 -- 
select distinct city
from station
where city like 'a%' or city like 'e%' 
or city like 'i%' or city like 'o%'
or city like 'u%';
-- ------------------------------------
select distinct city
from station
where substr(city,1,1) in ('A','E','I','O','U');
-- ------------------------------------
select distinct city
from station
where left(city,1) in ('A','E','I','O','U');
-- ------------------------------------
select distinct city
from station
where regexp_like(city, '^[AEIOU]');


-- #11 Weather Observation Station 8 --
select distinct city
from station
where left(city,1) in ('A','E','I','O','U') and 
right(city,1) in ('a','e','i','o','u');
-- ------------------------------------
select distinct city
from station
where regexp_like(city, '^[AEIOU]') and 
regexp_like(city, '[AEIOU]$');
-- ------------------------------------
select distinct city
from station
where substr(city,1,1) in ('A','E','I','O','U')
and substr(city, length(city), 1) in ('a','e','i','o','u');


-- #12 Weather Observation Station 9 --
select distinct city
from station
where left(city,1) not in ('A','E','I','O','U');
-- ------------------------------------
select distinct city
from station
where substr(city,1,1) not in ('A','E','I','O','U');
-- ------------------------------------
select distinct city
from station
where not regexp_like(city, '^[AEIOU]') ;


-- #13 Weather Observation Station 10 --
select distinct city
from station 
where right(city,1) not in ('a','e','i','o','u');
-- -------------------------------------
select distinct city
from station 
where substr(city, length(city),1) not in ('a','e','i','o','u');
-- -------------------------------------
select distinct city
from station
where not regexp_like(city, '[aeiou]$');


-- #14 Weather Observation Station 11 --
select distinct city
from station
where not regexp_like(city, '^[AEIOUaeiou]') or not regexp_like(city, '[AEIOUaeiou]$');
-- -------------------------------------
select distinct city
from station
where left(city,1) not in ('A','E','I','O','U') or
right(city,1) not in ('a','e','i','o','u');
-- -------------------------------------
select distinct city
from station
where substr(city,1,1) not in ('A','E','I','O','U') or 
substr(city,length(city),1) not in ('a','e','i','o','u');


-- #15 Weather Observation Station 12 --
select distinct city
from station
where not regexp_like(city, '^[AEIOUaeiou]') and 
not regexp_like(city, '[AEIOUaeiou]$');
-- --------------------------------------
select distinct city
from station
where left(city,1) not in ('A','E','I','O','U') and
right(city,1) not in ('a','e','i','o','u');
-- --------------------------------------
select distinct city
from station
where substr(city,1,1) not in ('A','E','I','O','U') and
substr(city,length(city),1) not in ('a','e','i','o','u');


-- #16 Higher Than 75 Marks --
select name
from students
where marks>75
order by right(name,3),id asc;


-- #17 Employee Names -- 
select name
from employee
order by name asc;


-- #18 Employee Salaries --
select name
from employee
where (salary>2000) and (months<10)
order by employee_id asc;


-- #19 Type of Triangle --
select case
when A+B <= C or B+C <= A or A+C <= C then 'Not A Triangle'
when A=B and A=C then 'Equilateral'
when A=B or B=C or A=C then 'Isosceles'
else 'Scalene'
end
from triangles;


-- #20 The PADS --
select concat(name,'(',upper(left(occupation,1)),')')
from occupations
order by name asc;
select concat('There are a total of ',count(occupation),' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(occupation), occupation asc;


-- #21 Revising Aggregations - The Count Function -- 
select count(name)
from city
where population>100000;


-- #22 Revising Aggregations - The Sum Function --
select sum(population)
from city
where district like '%California%';


-- #23 Revising Aggregations - Averages --
select avg(population)
from city
where district = 'California';


-- #23 Average Population --
select round(avg(population),0)
from city;


-- #24 Japan Population --
select sum(population)
from city
where countrycode = 'JPN';


-- #25 Population Density Difference --
select max(population)-min(population)
from city;


-- #26 The Blunder --
select ceil(avg(salary) - avg(replace(salary,'0','')))
from employees;


-- #27 Top Earners --
select months*salary, count(employee_id)
from employee
where months*salary = (select max(months*salary) from employee)
group by months*salary;


-- #28 























