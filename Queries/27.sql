select fac_id, extract(month from start_datetime) as month, sum(nhours) as thours from bookings."BOOKINGS"
where extract(year from start_datetime)='2012'
group by month, fac_id
order by fac_id, month;
