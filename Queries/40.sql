INSERT INTO bookings."FACILITIES" (id, name, cust_cost, guest_cost, purchase_cost, maintenance_cost)
VALUES ((select id+1 from bookings."FACILITIES" order by id desc limit 1), 'Squash Court 2', '3.5', '17.5', '5000', '80');

