-- Runs once on first container start. Creates the database and user that
-- config/mysql/sample_tpcc_config.xml connects with (admin/password ->
-- benchbase). Mirrors MYSQL_DATABASE/MYSQL_USER/MYSQL_PASSWORD from the
-- MySQL compose.
CREATE DATABASE IF NOT EXISTS benchbase;
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON benchbase.* TO 'admin'@'%';
FLUSH PRIVILEGES;
