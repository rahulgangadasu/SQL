DROP TRIGGER IF EXISTS payments_after_insert;

DELIMITER $$
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id; 
    
    INSERT INTO payments_audit
    VALUES(NEW.client_id, NEW.date, NEW.amount, 'INSERT', NOW());
END$$
DELIMITER ;

SELECT * FROM sql_invoicing.invoices;

INSERT INTO payments
VALUES(DEFAULT, 5, 3, '2019-02-02', 20, 1);

SELECT * FROM sql_invoicing.payments_audit;
SELECT * FROM sql_invoicing.payments;

-- --------------------------------------------- ---------
DROP TRIGGER IF EXISTS payments_after_delete; --  to drop triggers

DELIMITER $$
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
     INSERT INTO payments_audit
    VALUES(OLD.client_id, OLD.date, OLD.amount, 'DELETE', NOW());
END $$
DELIMITER ;

SELECT * FROM sql_invoicing.invoices;

DELETE FROM payments
WHERE payment_id = 12;

SELECT * FROM sql_invoicing.payments_audit;

SHOW TRIGGERS; -- to show all  triggers in database



