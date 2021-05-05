select to_char(b.start_datetime, 'YYYY-MM-DD HH24:MI:SS'), f.name
from bookings."BOOKINGS" as b, bookings."FACILITIES" as f
where date(b.start_datetime) = '2012-07-05' and f.name like 'Tennis%' and b.fac_id=f.id;