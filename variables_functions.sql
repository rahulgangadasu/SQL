-- Session Variables
SET @invoice_total = 0;

-- Local variables
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    
    SELECT count(*), sum(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total/invoices_count * 5;
    
    SELECT risk_factor;
END$$
DELIMITER ;

call sql_invoicing.get_risk_factor();

-- Functions
DELIMITER $$
CREATE FUNCTION get_risk_factor_for_client
(
	client_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    
    SELECT count(*), sum(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id;
    
    SET risk_factor = invoices_total/invoices_count * 5;
	RETURN IFNULL(risk_factor,0);
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS get_risk_factor_for_client;

SELECT
	client_id,
    name,
    get_risk_factor_for_client(client_id) as risk_factor
FROM clients;


