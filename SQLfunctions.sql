-- Numeric functions
select 
	round(6.9876, 2) as rounded,
	truncate(78.98765, 3) as truncated,
    ceiling(5.652) as ceiled,
    floor(9.91) as floored,
    abs(-3.87) as absolute,
    round(rand()*100, 3) as random_number;
    
-- String functions
select 
	length('rahul') as lengthof,
    upper('reddy') as in_upper_case,
    lower('GANGADASU') as in_lower_case,
    ltrim('           2803 W Royal Ln') as left_trim,
    rtrim('irving        ') as right_trim,
    left('texas', 2) left_string, -- returns 2 characters from left side of string
    right('united states', 3) as right_string, -- retuns 3 characters from right side of string 
	substring('rahul reddy gangadasu', 7, 5) as substring_,
    locate('a', 'reddy gangadasu') as find, -- not case-sensitive, if doesn't exist returns 0.
    replace('rahulg', 'g', ' g') as replace_,
	concat('rahul', ' reddy') as concated;

-- Date functions
select 
	now(),
    curdate(),
    curtime(),
    year(now()),
    dayname(now()),
    extract(day from now());
    
-- Date Formatting
select 
	date_format(now(), '%M %d %y') as d_format,
    time_format(now(), '%h : %i : %p') as t_format,
    date_add(now(), interval 2 day) as set_date,
    datediff('2026-05-07', '2026-04-03') as days_difference,
    time_to_sec('13:00'); -- seconds from 00:00 am
    
-- Ifnull and coalesce
use sql_store;
select 
	order_id,
    ifnull(shipper_id, 'not assigned') as shipper, -- used to replace null with something else.
    coalesce(shipper_id, comments, 'no status') as order_status
from orders;

-- if function
select
	order_id,
    order_date,
    if(year(order_date) = '2019',
		'active',
        'archived') as order_status
from orders;
    
-- the case operator
select
	order_id,
    order_date,
    case
		when year(order_date) = '2019' then 'active'
        when year(order_date) = year(now()) - 8 then 'last year'
        when year(order_date) < year(now()) - 8 then 'archived'
        else 'future'
	end as category
from orders;
    
    
    
    
    
    
    
    
    
    
    
    
    
    