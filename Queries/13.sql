select c.id,c.lastname,c.firstname,to_char(c.registerdate, 'YYYY-MM-DD HH:MI:SS'),
       to_char(b.start_datetime, 'YYYY-MM-DD HH:MI:SS'), f.name
from bookings."CUSTOMERS" as c, bookings."BOOKINGS" as b, bookings."FACILITIES" as f
where date(start_datetime) > '2012-10-01'
and b.cust_id=c.id
and b.fac_id=f.id;