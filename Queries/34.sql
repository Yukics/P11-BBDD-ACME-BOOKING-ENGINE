select c.lastname, c.firstname, b.cust_id as id, b.start_datetime
from (select a.cust_id, min(a.start_datetime) as start_datetime from(
    select * from bookings."BOOKINGS"
        where date(start_datetime) >= '2012-09-01' order by cust_id, start_datetime) as a
            group by a.cust_id) as b,
    bookings."CUSTOMERS" as c
where b.cust_id=c.id;

