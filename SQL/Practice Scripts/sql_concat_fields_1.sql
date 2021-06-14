DROP DATABASE IF EXISTS db_2;
CREATE DATABASE db_2;
USE db_2;

CREATE TABLE names (
	first_name		char(80),
    last_name		char(80)
);

INSERT INTO `names`
  VALUES ('Callum', 'Smith'), ('Steve', 'Boon'),
         ('Evelyn', 'Smith'), ('Rory', 'Smith'),
         ('Brigid', 'Unwin'), ('James', 'Reeves'),
         ('Josh', 'Douglas'), ('James', 'Reeves'),
         ('Georgio', 'Koushi'), ('Jodie', 'May');

ALTER TABLE names
	ADD COLUMN full_name char(80); 
		
UPDATE names
	SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM names;
	
