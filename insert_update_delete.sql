insert into customers
values(
		default,
        'Rahul',
        'Gangadasu',
        '1997-09-27',
        6035148977,
        '2803 W Royal Ln',
        'Irving',
        'TX',
        3366
	  );
select * from customers;

-- Inserting Hierarchial rows
insert into orders(customer_id, order_date, status) 
values(3, '2026-06-05', 2);

insert into order_items
values(last_insert_id(), 1, 1, 1.95),
	  (last_insert_id(), 3, 5, 3.95);
select * from order_items;

-- Create table (creates only the structure and data and doesn't primary key, auto increment... attributes)
create table orders_archived as 
(select * from orders);

-- Another way to insert data
insert into orders_archived 
select * from orders where order_date < '2018-01-01';
select * from orders_archived;

-- Update row in a table 
use sql_invoicing;
update invoices
set payment_total = 10.00, payment_date = '2019-03-01'
where invoice_id = 1;

select * from invoices where client_id = 2;

-- Using subqueries in updates(if the subquery returning single record)
use sql_invoicing;
update invoices
set payment_total = invoice_total * 0.5,
	payment_date = due_date
where client_id = 
(select client_id
from clients
where name = 'Myworks');

-- if subquery returns multiple rows.
update invoices
set payment_total = invoice_total * 0.5,
	payment_date = due_date
where client_id in 
(select client_id
from clients
where state in ('CA', 'NY'));

-- Delete row from a table

Delete from invoices 
where invoice_id = 1;



