select distinct concat_ws(' ', c.firstname, c.lastname) as customer, f.name as facility
from bookings."CUSTOMERS" as c, bookings."FACILITIES" as f, bookings."BOOKINGS" as b
where f.name like 'Tennis%'
and f.id=b.fac_id
and b.cust_id=c.id;