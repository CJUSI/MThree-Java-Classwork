
-- Refresh Database and Create
DROP DATABASE IF EXISTS corpdb;
CREATE DATABASE IF NOT EXISTS corpdb;
USE corpdb;

-- Create table for role
CREATE TABLE role (
	ID				INT				AUTO_INCREMENT 			PRIMARY KEY,
    NAME			VARCHAR(40)
);

-- Create the table for Employee
CREATE TABLE employee (
	ID				INT				AUTO_INCREMENT 			PRIMARY KEY,
	firstname		varchar(20),	
	lastname		varchar(20),	
	address			varchar(100),	
	phone			varchar(20),	
	dept			enum('Sales', 'Marketing', 'Compliance', 'Technical', 'Grounds'),	
	salary			INT,	
	role			INT,
    FOREIGN KEY (role) REFERENCES role(ID)
);

-- Insert role values into the role table
INSERT INTO role (NAME)
	VALUES ('Manager');
INSERT INTO role (NAME)
	VALUES ('Snr Manager');
INSERT INTO role (NAME)
	VALUES ('Jnr Associate');
INSERT INTO role (NAME)
	VALUES ('Pr. Engineer');
INSERT INTO role (NAME)
	VALUES ('Apprentice');

-- Insert values into employee table
INSERT into employee (firstname, lastname, salary, role)
	VALUES ('Harry', 'Potter', 1000, 1);
INSERT into employee (firstname, lastname, salary, role)
	VALUES ('Hermione', 'Granger', 2000, 2);
INSERT into employee (firstname, lastname, salary, role)
	VALUES ('Ron', 'Weasley', 1500, 3);
    
-- Show tables
SHOW TABLES;
DESC employee;
DESC role;