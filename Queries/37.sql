select distinct fac_id, sum(nhours) over (partition by fac_id) as total
from bookings."BOOKINGS"
order by total desc
limit 1;