select * from (
    select fac_id, sum(nhours) as num
        from bookings."BOOKINGS" group by fac_id) as a
where a.num > 1000 order by a.fac_id;