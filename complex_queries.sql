-- SubQuery
select *
from products
where unit_price >(
	select unit_price
	from products
	where product_id = 3);

-- In operator
select * 
from products
where product_id not in (
		select distinct product_id 
		from order_items);

-- Subqueries vs Joins
use sql_invoicing;
select * 
from clients
where client_id not in (
			select distinct client_id
			from invoices);
            
select *
from clients
left join invoices
using(client_id)
where invoice_id is null;

-- All Keyword ( 'all' compares given condition with every returned row )
select *
from invoices
where invoice_total > (
		select max(invoice_total)
		from invoices
		where invoice_id = 3
        );

select *
from invoices
where invoice_total > all (
		select invoice_total
		from invoices
		where invoice_id = 3
        );

-- any keyword
select *
from clients
where client_id in(
			select client_id
			from invoices
			group by client_id
			having count(*) > 2
			);
            
select *
from clients
where client_id = any(
			select client_id
			from invoices
			group by client_id
			having count(*) > 2
			);

-- Correlated subqueries
use sql_hr;
select *
from employees e
where salary >(
	  select avg(salary)
      from employees
      where office_id = e.office_id
	  );

-- exists keyword (when we use 'exists', it doesn't return result set unlike 'in')
use sql_invoicing;
select *
from clients
where client_id in(
	select client_id
    from invoices);

select *
from clients c
where exists (
	select client_id
    from invoices
    where client_id = c.client_id
    );

-- Subqueries in select
select 
	invoice_id,
    invoice_total,
    (select avg(invoice_total) from invoices) as invoice_average,
    invoice_total - (select invoice_average) as difference
from invoices;

-- Subqueries in from clause
select *
from (
	select 
		client_id,
		name,
		(select sum(invoice_total)
		from invoices
		where client_id = c.client_id) as total_sales,
		(select avg(invoice_total) from invoices) as invoice_average,
		(select total_sales - invoice_average) as difference
	from clients c
	) as sales_summary
where total_sales is not null;


    









