-- To run an event use this setting.
SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;

-- Creating Events
DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
	EVERY 1 YEAR STARTS NOW() ENDS NOW() + INTERVAL 1 YEAR
	-- AT '2019-01-01' for using only once 
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ;


-- View, Alter, Drop Events
SHOW EVENTS;
DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
-- Instead of CREATE EVENT we use ALTER EVENT to change the event.
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;



