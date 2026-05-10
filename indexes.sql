explain select customer_id from customers where state = 'CA';

CREATE INDEX idx_state ON customers(state);

explain select customer_id from customers  where points > 1000;

CREATE INDEX idx_points ON customers(points);

SHOW INDEX IN customers; -- to view index

ANALYZE TABLE customers;

-- Prefix Indexes

CREATE INDEX idx_last_name on customers(last_name(5));

-- Full text indexes

USE sql_blog;
SELECT *
FROM posts
WHERE title LIKE '%react redux%' OR
	  body LIKE '%react redux%';
      
CREATE FULLTEXT INDEX idx_title_body ON posts(title, body);
SELECT 
	*,
    MATCH(title, body)
	AGAINST('react redux') AS relevance_score
FROM posts
WHERE 
	MATCH(title, body)
	AGAINST('react -redux +form' IN BOOLEAN MODE); -- use boolean mode to exclude or include some text in search
    
-- Composite Indexes

USE sql_store;
SHOW INDEXES IN customers;

CREATE INDEX idx_state_points ON customers(state, points);
EXPLAIN SELECT customer_id
FROM customers
WHERE state = 'CA' AND points > '1000';

-- Order of columns in composite indexex (frequently used columns > High cardinality)

EXPLAIN SELECT customer_id
FROM customers
-- USE INDEX (idx_last_name_state)
WHERE state = 'CA' AND last_name LIKE 'A%';

SELECT 
	 COUNT(DISTINCT state),
	 COUNT(DISTINCT last_name)
FROM customers;

CREATE INDEX idx__state_last_name ON customers(state, last_name);

-- Index for sorting data

SELECT
	customer_id
FROM
	customers
ORDER BY
	state;

SHOW STATUS LIKE 'last_query_cost'


