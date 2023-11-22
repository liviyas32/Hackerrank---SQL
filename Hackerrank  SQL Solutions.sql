/* HACKERRANK SQL PRACTICE SESSION ANSWERS*/

/*BASIC SELECT*/
-- Revising the Select Query I --
select *
from city
where (countrycode = 'USA') and (population > 100000);

-- Revising the Select Query II -- 
select name
from city
where (countrycode = 'USA') & (population > 120000);

-- Select All --
select * from city;

-- Select By ID --
select *
from city
where id = 1661;

-- Japanese Cities' Attributes --
select *
from city
where countrycode = 'JPN';

-- Japanese Cities' Names -- 
select name
from city
where countrycode = 'JPN';

-- Weather Observation Station 1 --
select city, state
from station;

-- Weather Observation Station 3 -- 
select distinct city
from station
where mod(id,2)=0;

-- Weather Observation Station 4 --
select count(city)-count(distinct city) as difference
from station;

-- Weather Observation Station 5 --
with cityname as (
select distinct city, length(city) as city_legth
from station)

((select city, city_length
from citynname
where city_length = (select min(city_length) from cityname)
order by city desc
limit 1)
union
(select city, citylength
from cityname
where city_length = (select max(city_length) from cityname)
order by city asc
limit 1));

-- Weather Observation Station 6 --
select distinct city
from station
where substr(city,1,1) in ('A','E','I','O','U');
-- other methods --
select distinct city
from station
where left(city,1) in ('A','E','I','O','U');
-- -------------------------------------- 
select distinct city
from station
where regexp_like(city, '^[AEIOU]');

-- Weather Observation Station 7 --
select distinct city
from station
where regexp_like(city,'[aeiou]$');
-- other methods --
select distinct city
from station
where right(city,1) in ('a','e','i','o','u');
-- --------------------------------------------
select distinct city
from station
where substr(city, length(city), 1) in ('a','e','i','o','u');

-- Weather Observation Station 8 --
select distinct city
from station
where regexp_like(city, '^[AEIOUaeiou]') and regexp_like(city, '[aeiouAEIOU]$');

-- Weather Observation Station 9 --
select distinct city
from station
where left(city,1) not in ('a','e','i','o','u');

-- Weather Observation Station 10 --
select distinct city
from station
where substr(city, length(city), 1) not in ('a','e','i','o','u');

-- Weather Observation Station 11 --
select distinct city
from station
where not regexp_like(city, '^[AEIOUaeiou]') and regexp_like(city, '[aeiouAEIOU]$');

-- Weather Observation Station 12 --
select distinct city
from station
where not regexp_like(city, '^[AEIOUaeiou]') or regexp_like(city, '[aeiouAEIOU]$');

-- Higher than 75 Marks -- 
select name
from students
where marks>75
order by right(name,3), id asc;

-- Employee Names --
select name
from employee
order by name;

-- Employee Salaries --
select name
from employee
where (salary > 2000) and (months<10)
order by employee_id asc;

/*ADVANCED SELECT*/
-- Type of Triangle --
select 
case 
	when (A+B <= C) | (B+C <=A) | (A+C <= B) then 'Not a Triangle'
    when (A=B) & (B=C) then 'Equilateral'
    when ((A=B) & (A !=C)) | ((B=C) & (B!=A)) | ((A=C) & (A!=B)) then 'Isoceles'
    when (A!=B) & (B!=C) & (A!=C) then 'Scalene'
    end as triangle_types
from triangles;

-- The Pads --
select concat(name,'(',left(occupation,1),')')
from occupations
order by name;
select concat('There are a total of ', count(occupation), ' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(occupation);

-- Occupations --
select doctors, professors, singers, actors
from 
(select num, 
max(case when occupation = 'Doctor' then name end) as doctors,
max(case when occupation = 'Professor' then name end) as professors,
max(case when occupation = 'Singer' then name end) as singers,
max(case when occupation = 'Actor' then name end) as actors
from 
(select row_number() over (partition by occupation order by name asc) as num, name, occupation
from occupations) as temp
group by num) as table_;

-- Binary Tree Nodes --
select n,
case
	when p is null then 'Root'
    when (select count(*) from BST where temp.n = p)=0 then 'Leaf'
    else 'Inner'
end as node_status
from BST as temp
order by n asc;

-- New Companies -- 
select c.company_code, c.founder, count(distinct lm.lead_manager_code) as lm_count, 
count( distinct sm.senior_manager_code) as sm_count, count(distinct m.manager_count) as m_count,
count(distinct e.employee_code) as emp_count
from company as c join lead_manager as lm on c.company_code = lm.company_code
join senior_manager as sm on lm.lead_manager_code = sm.led_manager_code
join manager as m on sm.senior_manager_code = m.senior_manager_code
join employee as e on m.manager_code = e.manager_code
group by c.company_code, c.founder
order by c.company_code asc;

/*AGGREGATION*/
-- Revising Aggregations - The Count Function -- 
select count(name) as city_count
from city
where population > 100000;

-- Revising Aggreagtions - The Sum Function -- 
select sum(population)
from city
where district = 'California';

-- Revising Aggregations - Averages -- 
select avg(population)
from city
where district = 'California';

-- Average Population -- 
select round(avg(population))
from city;

-- Japan Population --
select sum(population) as jpn_pop
from city
where countrycode = 'JPN';

-- Population Density Difference --
select max(population) - min(population) as difference
from city;

-- The Blunder -- 
select ceil(avg(salary) - avg(replace(salary,0,'')))
from employees;

-- Top Earners --
select total_earnings, count(*)
from 
(select *, months*salary as total_earnings 
from employee) as temp
where total_earnings = (select max(months*salary) from employee)
group by total_earnings;   

-- Weather Observation Station 2 --
select round(sum(lat_n),2) as lat, round(sum(long_w),2) as lon
from station;

-- Weather Observation Station 13 --
select truncate(sum(lat_n),4)
from station
where (lat_n>38.7880) and (lat_n<137.2345);

-- Weather Observation Station 14 --
select truncate(max(lat_n),4)
from station
where lat_n < 137.2345;

-- Weather Observation Station 15 --
select round(long_w,4)
from station
where lat_n = (select max(lat_n) from station where lat_n < 137.2345);

-- Weather Observation Station 16 --
select round(min(lat_n),4)
from station
where lat_n > 38.7780;

-- Weather Observation Station 17 --
select round(long_w,4)
from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);

-- Weather Observation Station 18 --
with temp as
(select min(lat_n) as a, min(long_w) as b, max(lat_n) as c, max(long_w) as d
from station)

select round(abs(c-a)+abs(d-a),4) as man_distance
from temp;

-- Weather Observation Station 19 --
with temp as
(select min(lat_n) as a, max(lat_n) as b, min(long_w) as c, max(long_w) as d
from station)

select format(sqrt(power(b-a,2)+power(d-c,2)),4)
from temp;

-- Weather Observation Station 20 --
with temp as 
(select row_number() over (order by lat_n) as rn, lat_n
from station
order by lat_n)

select round(lat_n,4)
from temp
where rn = (select (max(rn)+1)/2 from temp);

/*BASIC JOIN*/
-- Population Census --
select sum(ci.population)
from city as ci join country as co on ci.countrycode = co.code
where co.continent = 'Asia';

-- African Cities -- 
select ci.name
from city as ci join country as co on ci.countrycode = co.code
where co.continent = 'Africa';

-- Average Population of Each Continent --
select co.continent, floor(avg(ci.population)) as city_population
from city as ci join country as co on ci.countrycode = co.code
group by co.continent;

-- The Report -- 
select
case 
	when grade >=8 then s.name
    when grade < 8 then null
end as name, g.grade, s.marks
from students as s left join grade as g 
on s.marks >= g.min_mark and s.marks <= g.max_mark
order by g.grade desc, name asc, s.marks asc;

-- Challenges --
create view abc as 
(
with temp as 
(select h.hacker_id, h.name, count(c.challenge_id) as total_challenges
from hackers as h join challenges as c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
order by total_challenges desc)

select total_challenges, count(*)
from temp
group by total_challenges
having not(total_challenges < (select max(total_challenges) from temp) and count(total_challenges) > 1));

with challenge as 
(select h.hacker_id, h.name, count(c.challenge_id) as total_challenges
from hackers as h join challenges as c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
order by total_challenges desc, hacker_id)

select hacker_id, name, total_challenges
from challenge
where total_challenges in (select total_challenges from abc);

-- Contest Leaderboard -- 
select hackers.hackerid, hackers.name, sum(max_score) as total_score
from hackers join 
(select hacker_id, challenge_id, max(score) as max_score
from submissions
group by hacker_id, challenge_id) as maximum
on hackers.hacker_id = maximum.hacker_id 
group by hackers.hacker_id, hackers.name
having sum(max_score)>0
order by total_score desc, hackers.hacker_id asc;

/*ADVANCED JOIN*/
-- Placements --
select sname
from 
(with fs as 
(select f.id, f.friend_id, p.salary as fsalary
from packages as p join friends as f on p.id = f.friend_id)

select s.id as sid, s.name as sname, p.salary as ssalary, f.friend_id as fid, fsalary
from students as s join packages as p on s.id = p.id
join friends as f on s.id = f.id
join fs on f.friend_id = fs.friend_id) as t
where fsalary > ssalary
order by fsalary;

/*ALTERNATIVE QUERIES*/
-- Draw the triangle 1 --
select @asterick = 21;

select repeat('* ', @asterick:= @asterick-1)
from information_schema.tables
where @asterick > 0;

-- Draw the triangle 2 --
select @asterick = 0;

select repeat('* ', @asterick:= @asterick+1)
from information_schema.tables
where @asterick<20;











