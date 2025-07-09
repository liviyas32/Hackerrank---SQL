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

