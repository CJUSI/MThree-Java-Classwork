-- Group By Manipulation --

-- Group by gender type --
SELECT * FROM student;
SELECT COUNT(*) 'Number of students', gender FROM student
	GROUP BY gender;
    
-- Select for gender count > 2 --
SELECT * FROM student;
SELECT COUNT(*) 'Number of students', gender FROM student
	GROUP BY gender
		HAVING COUNT(*) < 2;



