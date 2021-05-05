select c.id, concat_ws(' ', c.firstname, c.lastname) as customer, concat_ws(' ',l.rid, l.firstname, l.lastname) as recommend_by
from bookings."CUSTOMERS" as c,
     (select distinct c.id as rid, c.firstname, c.lastname
        from bookings."CUSTOMERS" as c, (select recommended_id as rid from bookings."CUSTOMERS") as x
            where c.id = x.rid) as l
where c.recommended_id=l.rid
union
select c.id, concat_ws(' ', c.firstname, c.lastname) as customer, '' as recommend_by from bookings."CUSTOMERS" as c
where recommended_id is null
order by customer;