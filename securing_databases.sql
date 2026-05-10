 -- Creating user to connect on current machine
CREATE USER rahul@127.0.0.1;
CREATE USER phanindra@localhost;

-- Creating user to connect on any machine
CREATE USER reddy@'www.reddy.com';
CREATE USER reddy@'%.www.reddy.com'; -- includes sub-domains

-- Creating user to connect from anywhere.
CREATE USER rahul IDENTIFIED BY '2709';

-- Viweing users
SELECT * FROM mysql.user;

-- Dropping users
CREATE USER pandu IDENTIFIED BY '3366';
DROP USER pandu;

-- Chanings passwords
SET PASSWORD FOR rahul = '1808';

-- Privileges
 -- 1. Web/Desktop application
		CREATE USER moon_app IDENTIFIED BY '2709';
        GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
        ON sql_store.*
        TO moon_app;
        
	-- 2. Admin
		GRANT ALL
        ON *.*
        TO rahul;

-- Viweing privileges
SHOW GRANTS FOR rahul;

-- Revoking privileges
GRANT CREATE VIEW
ON sql_store.*
TO moon_app;

REVOKE CREATE VIEW
ON sql_store.*
FROM moon_app;







