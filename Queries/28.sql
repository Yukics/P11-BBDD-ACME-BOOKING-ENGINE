select count(*) as num from (select distinct cust_id from bookings."BOOKINGS") as a;
