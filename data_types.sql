-- Strings Types
	-- CHAR(X), VARCHAR(X) {64KB}, MEDIUMTEXT {16MB}, LONGTEXT {4GB}, TINYTEXT {255B}, TEXT {64KB}
-- Integer Types
	-- TINYINT {1B} [-128, 127], UNSIGNED TINYINT[0, 255], SMALLINT {2B} [-32K, 32K], MEDIUMINT {3B} [-8M, 8M],
	-- INT {4B} [-2B, 2B], BIGINT {8B} [-9Z, 9Z]
-- Floating Point Types
	-- DECIMAL(p, s), DEC, NUMERIC, FIXED, FLOAT, DOUBLE
-- Boolean Types
	-- BOOL, BOOLEAN (TRUE AND FALSE).
-- Enum and Set Types
	-- ENUM('value1', 'value2'), SET(...)
--  Date and Time Types
	-- DATE, TIME, DATETIME {8B}, TIMESTAMP {4B}, YEAR
-- Blob Types (for storing images, videos, binary data)
	-- TINYBLOB {255B}, BLOB {64KB}, MEDIUMBLOB {16MB}, LONGBLOB {4GB}
    
-- JSON Types
UPDATE products
SET properties = JSON_OBJECT(
'weight', '10',
'dimensions', JSON_ARRAY(1,2,3),
'manufacture', JSON_OBJECT('name', 'roku'))
WHERE product_id = 1;

SELECT * FROM sql_store.products;

SELECT
	product_id,
    JSON_EXTRACT(properties, '$.weight') as product_weight,
    properties -> '$.dimensions' as product_dimensions,
    properties -> '$.dimensions[1]' as product_y_dimension, -- (-> is column path operator, $. is accessing path)
    properties ->> '$.manufacture.name' as manufacturer -- (to extract roku without quotes)
FROM products
WHERE product_id = 1;

-- Update JSON properties

UPDATE products
SET properties = JSON_SET(
properties,
'$.weight', 20,
'$.screen', 'UHD'
)
WHERE product_id = 1;

SELECT
	product_id,
    JSON_EXTRACT(properties, '$.weight') as product_weight,
    properties ->> '$.screen' as screen
FROM products
WHERE product_id = 1;

-- Remove JSON property
UPDATE products
SET properties = JSON_REMOVE(
properties,
'$.screen'
)
WHERE product_id = 1;










