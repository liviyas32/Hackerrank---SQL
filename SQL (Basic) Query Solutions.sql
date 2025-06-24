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



