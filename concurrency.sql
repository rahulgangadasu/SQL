USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 100 
WHERE customer_id = 1;
COMMIT;

USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA' 
WHERE customer_id = 3;
COMMIT;