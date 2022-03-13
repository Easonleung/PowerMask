CREATE DATABASE db_totara15 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- First create a new user, change username and password to match your requirements
CREATE LOGIN totara_admin
    WITH PASSWORD = 'digital';
GO
 
-- Now make sure this user can install the site, ALTER SETTINGS permissions is needed for this
USE master;
 
GRANT ALTER SETTINGS TO testuser;
 
-- For the database (substitute with the database name of your choice)
-- create a login for the user and make sure he has the permissions needed
USE totara_15;
 
CREATE USER testuser FOR LOGIN testuser;
 
-- Make sure the user can create tables, read and write data
ALTER ROLE db_ddladmin ADD MEMBER testuser;
ALTER ROLE db_datareader ADD MEMBER testuser;
ALTER ROLE db_datawriter ADD MEMBER testuser;
 
-- Create a custom role
CREATE ROLE db_totara;
 
-- This is needed to view any definition created by Totara
GRANT VIEW DEFINITION TO db_totara;
 
ALTER ROLE db_totara ADD MEMBER testuser;
 
GO


-- Take away the ALTER SETTINGS permission, it's not needed anymore
USE master;
 
REVOKE ALTER SETTINGS TO testuser;
 
USE totara_15;
 
-- Make sure the user role has access to Totara's custom stored procedures
GRANT EXECUTE ON dbo.GROUP_CONCAT_D TO db_totara;
GRANT EXECUTE ON dbo.GROUP_CONCAT_S TO db_totara;
GRANT EXECUTE ON dbo.GROUP_CONCAT_DS TO db_totara;
GRANT EXECUTE ON dbo.GROUP_CONCAT TO db_totara;
 
GO
