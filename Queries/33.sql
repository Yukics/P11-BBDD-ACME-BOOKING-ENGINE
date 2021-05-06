SELECT fac_id, date_part('month', start_datetime), SUM(nhours)
FROM bookings."BOOKINGS"
WHERE date_part('year', start_datetime) = 2012
GROUP BY ROLLUP(fac_id, date_part('month', start_datetime))
ORDER BY fac_id, date_part('month', start_datetime);
