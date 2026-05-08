DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
 SELECT * FROM clients;
 END$$
 DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balances()
BEGIN
	SELECT * FROM invoices WHERE (invoice_total - payment_total) > 0;
END$$
DELIMITER ; 

DROP PROCEDURE IF EXISTS get_payments;