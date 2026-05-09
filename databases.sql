CREATE DATABASE sql_store2;
DROP DATABASE IF EXISTS sql_store2;

-- Create table
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Alter table
ALTER TABLE customers
	ADD work_email VARCHAR(50) NOT NULL UNIQUE AFTER last_name,
    MODIFY COLUMN phone VARCHAR(15);

-- Creating relationships
CREATE TABLE IF NOT EXISTS orders
(
order_id 	INT PRIMARY KEY,
customer_id INT NOT NULL,
FOREIGN KEY fk_orders_customers (customer_id)
	REFERENCES customers (customer_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);


