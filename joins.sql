select 
	order_id, 
    o.customer_id, 
    first_name, 
    last_name
from 
	orders o
join
	customers c
    on o.customer_id = c.customer_id;
    
    
-- self join
USE sql_hr;
select 
	 e.employee_id,
     e.first_name as employee,
      m.first_name as manager
from employees e 
join employees m 
	on e.reports_to = m.employee_id
    limit 10;
    

-- Self Outer join
USE sql_hr;
select 
	 e.employee_id,
     e.first_name as employee,
      m.first_name as manager
from employees e 
left join employees m 
	on e.reports_to = m.employee_id
    limit 10;
    
    
-- Joining multiple tables
select 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name as status
from orders o
join customers c
	on o.customer_id = c.customer_id
join order_statuses os
	on o.status = os.order_status_id;


-- Implicit join syntax
select * from customers c, orders o where c.customer_id = o.customer_id;


-- Outer Joins
select 
	 c.customer_id,
     c.first_name,
     o.order_id,
     sh.name as name
from customers c
left join orders o
		on c.customer_id = o.customer_id
left join shippers sh
	on o.shipper_id = sh.shipper_id
order by c.customer_id;

-- Using clause
select *
from order_items oi
left join order_item_notes oin
using (order_id, product_id);

-- Natural Join (sql engine identifies the common column and joins the tables.)
select * from orders o natural join customers c;

-- Cross Join (every record from first table joins with every record from second table [n*m].)
select * from orders o cross join customers c;

-- Union(used to combine records from multiple queries)
select 
	order_id,
    order_date,
    'active' as status
from 
	orders
where 
	order_date >='2018-01-01'
union
select 
	order_id,
    order_date,
    'archived' as status
from 
	orders
where 
	order_date <'2018-01-01';








