USE sql_store;

select
	customer_id,
	first_name, 
    last_name, 
    address, 
    state, 
    birth_date, 
    phone,
    points
from customers
-- where customer_id != 3
where birth_date > '1990-04-07' 
   or Not points > 1000 
   or state in('_A', 'TX') 
   and last_name like '%y'
   and address regexp '(trail|avenue)$'
   or phone is null
order by last_name
limit 3,5