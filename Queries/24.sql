select concat_ws(' ', c.firstname, c.lastname) as customer, f.name as facility,
       case
        when c.id=0 then
            trunc((cast(f.guest_cost as numeric)*b.nhours),2)
        else
            trunc((cast(f.cust_cost as numeric)*b.nhours),2)
        end as cost

from bookings."BOOKINGS" as b, bookings."FACILITIES" as f, bookings."CUSTOMERS" as c
where date(b.start_datetime)='2012-09-14'
  and
      case
        when c.id=0 then
            (cast(f.guest_cost as numeric)*b.nhours) > 30
        else
            (cast(f.cust_cost as numeric)*b.nhours) > 30
        end
and b.fac_id=f.id and c.id=b.cust_id
order by cost desc