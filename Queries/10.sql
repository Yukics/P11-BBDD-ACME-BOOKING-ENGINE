select * from bookings."FACILITIES" where CAST (cust_cost AS numeric) > 0
                                      and CAST (cust_cost AS numeric) < (CAST (maintenance_cost AS numeric) / 50 );