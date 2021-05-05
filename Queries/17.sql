select concat_ws(' ', c.firstname, c.lastname), to_char(c.registerdate, 'YYYY-MM-DD HH24:MI:SS') from bookings."CUSTOMERS" as c,
        (select registerdate as mydate from bookings."CUSTOMERS" order by registerdate desc limit 1) as b
where c.registerdate = b.mydate;