USE sql_store;

START TRANSACTION;
INSERT INTO orders (customer_id, order_date, status)
VALUES(1, '2020-01-01', 1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 1, 1, 1);
COMMIT;


START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;


