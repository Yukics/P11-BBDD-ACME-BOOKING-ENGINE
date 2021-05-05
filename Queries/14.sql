select c.lastname, c.firstname, c.id, b.start_datetime
from bookings."BOOKINGS" as b, bookings."CUSTOMERS" as c
where b.cust_id=c.id
order by b.start_datetime limit 10;