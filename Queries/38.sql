select x.name, sum(0+1) over (order by x.revenue desc) from (
select a.name, cast(sum(cost) as money) as revenue from (select name, cust_id,
       case
          when cust_id=0 then
              (cast(f.guest_cost as numeric)*b.nhours)
          else
              (cast(f.cust_cost as numeric)*b.nhours)
          end as cost
      from bookings."BOOKINGS" as b, bookings."FACILITIES" as f where b.fac_id=f.id) as a
group by name
order by revenue desc) as x limit 3;