DROP DATABASE IF EXISTS namesdb;
CREATE DATABASE namesdb;
USE namesdb;

CREATE TABLE names (
	first_name		char(80),
    last_name		char(80)
);

INSERT INTO `names`
  VALUES ('Callum', 'Smith'), ('Steve', 'Boon'),
         ('Evelyn', 'Smith'), ('Rory', 'Smith'),
         ('Brigid', 'Unwin'), ('James', 'Reeves'),
         ('Josh', 'Douglas'), ('Jimmy-Lee', 'Norman'),
         ('Georgio', 'Koushi'), ('Jodie', 'May');