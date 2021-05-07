UPDATE bookings."FACILITIES"
SET cust_cost  = (select cust_cost*1.1 from bookings."FACILITIES" where name='Tennis Court 2'),
    guest_cost = (select guest_cost*1.1 from bookings."FACILITIES" where name='Tennis Court 2')
WHERE id = 1;

select * from bookings."FACILITIES";