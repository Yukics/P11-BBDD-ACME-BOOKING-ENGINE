select c.firstname, c.lastname from bookings."CUSTOMERS" as c
where c.id in (select recommended_id from bookings."CUSTOMERS")
order by lastname;