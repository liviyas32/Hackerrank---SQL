/* SQL (Intermediate) Query Solutions */

-- #1 Weather Observation Station 5 -- 
with temp as (
select city, length(city), row_number() over() as row_no
from station
order by length(city), city asc)

(select city, length(city)
from temp
where row_no = (select min(row_no) from temp))
union
(select city, length(city)
from temp
where row_no = (select max(row_no) from temp));


-- #2 New Companies --
select c.company_code, c.founder, count(distinct lm.lead_manager_code),
count(distinct sm.senior_manager_code), count(distinct m.manager_code),
count(distinct e.employee_code)
from company as c inner join lead_manager as lm on c.company_code = lm.company_code
inner join senior_manager as sm on lm.company_code = sm.company_code
inner join manager as m on sm.company_code = m.company_code
inner join employee as e on m.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code asc;


-- #
