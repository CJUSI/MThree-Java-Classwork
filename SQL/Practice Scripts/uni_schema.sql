DROP DATABASE IF EXISTS unidb;
CREATE DATABASE if NOT EXISTS unidb;
USE unidb;

CREATE TABLE student (
	id			INT				PRIMARY KEY,
	NAME		VARCHAR(30),
	dob			DATE,
	email		VARCHAR(40),
    gender		char(1)			NOT NULL
);

CREATE TABLE course (
	id				INT				PRIMARY KEY,
	NAME			VARCHAR(50),
	NUMBER			CHAR(4),
	instructor		VARCHAR(20)
);

CREATE TABLE student_course (
	studentId		INT,
	courseId		INT,
	
	FOREIGN KEY (studentId) REFERENCES student(id),
	FOREIGN KEY (courseId) REFERENCES course(id),
	PRIMARY KEY (studentId, courseId)
);

DESC student_course;

INSERT INTO student 
	VALUES (1, 'Edward Cullen', '1800-01-13', 'ed@cullen.com', 'M');
INSERT INTO student 
	VALUES (2, 'Jacob', '2000-01-11', 'jacob@lupus.com', 'W');
INSERT INTO student (id, name, dob, gender) 
	VALUES (3, 'Bella Swan', '2000-01-11', 'M');
INSERT INTO student 
	VALUES (4, 'Alice Cullen', '2000-01-11', 'alice@cullen.com', 'F');
INSERT INTO student 
	VALUES (5, 'Esme Cullen', '2000-01-11', 'esme@cullen.com', 'F');
INSERT INTO student 
	VALUES (6, 'James Volturi', '2000-01-11', 'james@volturi.com', 'V');

INSERT INTO course 
	VALUES (101, 'Posing', 'c104', 'Albus Dumbledore');
INSERT INTO course 
	VALUES (102, 'Rivalry', 'c105', 'Snap');
INSERT INTO course (id, name, number)  
	VALUES (103, 'Envy', 'c106');
INSERT INTO course 
	VALUES (104, 'Jealousy', 'c107', 'Minerva');
INSERT INTO course (id, name, number) 
	VALUES (105, 'Bitterness', 'c108');

INSERT INTO student_course 
	VALUES (1, 101);
INSERT INTO student_course 
	VALUES (2, 102);
INSERT INTO student_course 
	VALUES (1, 102);
INSERT INTO student_course 
	VALUES (3, 103);
INSERT INTO student_course 
	VALUES (4, 104);
INSERT INTO student_course 
	VALUES (5, 105);
INSERT INTO student_course 
	VALUES (6, 103);

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student_course;