select distinct lastname as field from bookings."CUSTOMERS"
union
select name as field from bookings."FACILITIES" order by field;