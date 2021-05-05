select c.firstname, c.lastname, count(c.firstname)
from bookings."CUSTOMERS" as c, (select recommended_id as rid from bookings."CUSTOMERS") as x
where c.id = x.rid
group by c.firstname, c.lastname
order by c.lastname;