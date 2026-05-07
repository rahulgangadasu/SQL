use sql_invoicing;
create  or replace view sales_by_client as
select 
	client_id,
    name,
    sum(invoice_total) as total_sales
from clients c
join invoices i
using (client_id)
group by client_id, name;

SELECT * 
FROM sql_invoicing.sales_by_client
order by client_id desc;

drop view sales_by_client;

-- Updatable views
	-- views are updatable if they don't have
		-- distinct, aggregate functions, group by/having, union
create or replace view invoices_with_balance as
select 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total as balance,
    invoice_date,
    due_date,
    payment_date
from invoices
where (invoice_total - payment_total) > 0
with check option;

delete from invoices_with_balance
where invoice_id = 1;

update invoices_with_balance
set due_date = date_add(due_date, interval 2 day)
where invoice_id = 3;

update invoices_with_balance
set payment_total = invoice_total
where invoice_id = 3;


