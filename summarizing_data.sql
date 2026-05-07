use sql_invoicing;
-- Aggregate functions
select 
	max(invoice_total),
    min(invoice_total),
    avg(invoice_total),
    sum(invoice_total * 10),
    count(invoice_total), -- count() only returns non null values.
    count(*), -- includes null values.
    count(distinct client_id)
from invoices
where invoice_date >'2019-07-01';

-- Group by clause
select 
    c.state,
    c.city,
    sum(invoice_total) as total_sales
from invoices i
join clients c 
	using(client_id)
group by state,city;

-- Having clause (used to filter data after grouping data and we can include only columns that are retrived using group by)

select
	client_id,
    sum(invoice_total) as total_sales,
    count(*) as number_of_invoices
from invoices
group by client_id
having total_sales> 800
	and number_of_invoices > 5;


-- roll up operator(applies only to columns that aggregate values)

select 
	state,
    city,
    sum(invoice_total) as total_sales
from invoices i
join clients c
	using (client_id)
group by state,city with rollup   -- (roll up calculates aggregate for each group and then total)




