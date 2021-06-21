-- Select correct DB --
USE corpdb;

-- Select first and last name from employee
SELECT firstname, lastname, NAME AS role
	FROM employee
		INNER JOIN role ON employee.role = role.ID;
        
SELECT e.firstname, e.lastname, r.NAME AS role
	FROM employee e
		LEFT OUTER JOIN role r ON e.role = r.ID
			WHERE r.id = 2;

-- Create Views and display from it
CREATE OR REPLACE VIEW employeeSalaries AS 
	SELECT concat(firstname, ' ', lastname) AS full_name, salary FROM employee;

SELECT * FROM employeeSalaries
	WHERE salary > 1500;

    