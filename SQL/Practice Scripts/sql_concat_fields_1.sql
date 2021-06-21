USE namesdb;

-- Add new column - full_name
ALTER TABLE names
	ADD COLUMN full_name char(80); 

-- Populate new column with concat string of first and last names
UPDATE names
	SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM names;
-- Show new table with full name column

	
