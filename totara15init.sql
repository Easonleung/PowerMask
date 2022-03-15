CREATE DATABASE totara_15 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'totara'@'localhost' IDENTIFIED BY 'digital';
GRANT ALL ON totara_15.* TO 'totara'@'localhost'

FLUSH PRIVILEGES
