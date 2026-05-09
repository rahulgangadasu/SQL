explain select customer_id from customers where state = 'CA';

CREATE INDEX idx_state ON customers(state);

explain select customer_id from customers  where points > 1000;

CREATE INDEX idx_points ON customers(points);

SHOW INDEX IN customers; -- to view index

ANALYZE TABLE customers;

-- Prefix Indexes

CREATE INDEX idx_last_name on customers(last_name(5));



