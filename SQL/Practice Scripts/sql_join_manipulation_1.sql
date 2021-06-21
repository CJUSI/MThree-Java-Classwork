-- Select correct DB to work with --
USE unidb;

-- Full outer join (using aliases)
SELECT s.NAME, s.dob, s.email, c.name, c.number, c.instructor
	FROM student_course sc 
		RIGHT JOIN student s ON s.id = sc.studentid
		RIGHT JOIN course c ON c.id = sc.courseid;
	

		

