select to_char(b.start_datetime, 'YYYY-MM-DD HH24:MI:SS'), c.firstname, c.lastname
from bookings."CUSTOMERS" as c, bookings."BOOKINGS" as b
where c.firstname like 'E%' and c.lastname like 'Crumpet' and b.cust_id=c.id;