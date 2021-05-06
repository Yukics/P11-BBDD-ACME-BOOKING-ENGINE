select fac_id, sum(nhours) as nhours from bookings."BOOKINGS"
group by fac_id
order by nhours desc
limit 1;