select name,
       case
            when cast(maintenance_cost as numeric) > 150 then
                    'expensive'
            else
                    'cheap'
           end as cheap_or_not, cust_cost, guest_cost, maintenance_cost from bookings."FACILITIES";