select fac_id, sum(nhours) as thours from bookings."BOOKINGS"
where date(start_datetime) > '2012-08-31' and date(start_datetime) < '2012-10-1'
group by fac_id
order by thours;