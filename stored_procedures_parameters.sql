DELIMITER $$
CREATE PROCEDURE get_clients_by_state(p_state CHAR(2))
BEGIN
	SELECT * FROM clients
    WHERE state = p_state;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_invoices_by_client(p_client_id INT)
BEGIN
	SELECT * FROM invoices
    WHERE client_id = p_client_id;
END$$
DELIMITER ;

call get_invoices_by_client(3);

DROP PROCEDURE IF EXISTS get_clients_by_state;

-- procedure with default parameters
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(p_state CHAR(2))
BEGIN
	IF p_state IS NULL THEN
		SET p_state = 'CA';
    END IF;
    SELECT * FROM clients WHERE state = p_state;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_clients_by_state2;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state2(p_state CHAR(2))
BEGIN
    SELECT * 
    FROM clients c
    WHERE c.state = IFNULL(p_state, c.state);
END$$
DELIMITER ;

-- Parameter Validation
DELIMITER $$
CREATE PROCEDURE make_payment
	(
		invoice_id INT,
        payment_amount DECIMAL(9,2),
        payment_date DATE
	)
BEGIN
	IF payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = 'Invalid Payment Amount';
	END IF;
	UPDATE invoices i
	SET 
		i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS make_payment;

call sql_invoicing.make_payment(2, 120, '2019-04-01');

select * from invoices;

-- Output parameters
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client
	(
		client_id INT,
        OUT invoices_count INT,
        OUT invoices_total DECIMAL(9,2)
	)
BEGIN
	SELECT 
		count(*), sum(invoice_total)
	INTO invoices_count, invoices_total
	FROM invoices i
	WHERE i.client_id = client_id
	AND payment_total = 0;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;

select * from invoices where client_id = 3;

