-- Select database to manipulate
USE PersonalTrainer;

-- Activity 1 - Count number of clients
SELECT COUNT(*)
	FROM client;

-- Activity 2 - Count number of clients with birthdays - less values as some are null or people share the same birthdays
SELECT COUNT(BirthDate)
	FROM client;

-- ACtivity 3 - Group clients by city and count them.
SELECT 
	City, COUNT(*) as client_count
		FROM client
			GROUP BY City
            ORDER BY client_count DESC;
            
-- Activity 4 - Calculate total by invoice using invoicelineitem table
SELECT 
	InvoiceId, SUM((Quantity * Price)) as invoice_total
 		FROM invoicelineitem
 			GROUP BY InvoiceId;
            
-- Activity 5 - Modify previous query to only include totals greater than 500 sorted from H->L
SELECT 
	InvoiceId, SUM(Quantity * Price) as invoice_total
		FROM invoicelineitem
			GROUP BY InvoiceId
				HAVING invoice_total > 500
					ORDER BY invoice_total ASC;
                    
-- Activity 6 - Avg line item total, grouped by invoiceLineItem description
SELECT
	Description, AVG(Quantity * Price) as invoice_average
		FROM invoicelineitem
			GROUP BY Description
			ORDER BY invoice_average;
				
-- Activity 7 - Select ID name and total from clients who have already paid over 1000
SELECT c.ClientId, FirstName, LastName, SUM(Quantity*Price) Total
	From Client c
		INNER JOIN invoice i ON c.ClientId = i.ClientId
        INNER JOIN invoicelineitem l ON i.invoiceId = l.InvoiceId
				WHERE InvoiceStatus = 2 
					GROUP BY c.ClientId
						HAVING Total >= 1000
							ORDER BY LastName, FirstName;


-- Activity 8 - Count excercises by category
-- SELECT c.Name as CategoryName, COUNT(e.sets) as ExerciseCount
	-- FROM ExerciseCategory c 
	-- INNER JOIN exerciseinstance e ON c.
		-- GROUP BY Name;
			
-- Activity 9 - Select exercise.Name with min, max and av excerciseinstance sets
SELECT e.Name as ExerciseName, MIN(i.Sets) as MinSets, MAX(i.sets) as MaxSets, AVG(i.sets) as AvgSets
	FROM exercise e
		INNER JOIN exerciseinstance i ON e.ExerciseId = i.ExerciseId
			GROUP BY e.Name
            ORDER BY e.Name;
            
-- Activity 10 - Find Min and Max of client Birthdate per workout.
SELECT w.Name as WorkoutName, MIN(c.BirthDate) as EarliestBirthDate, MAX(c.BirthDate) as LatestBirthDate
	FROM Client c
		INNER JOIN ClientWorkout i ON c.ClientId = i.ClientId
        INNER JOIN workout w ON i.WorkoutId = w.WorkoutId
			GROUP BY w.Name
            ORDER BY w.Name;

-- Activity 11 - Count Client Goals
SELECT c.ClientId as ClientId, COUNT(g.GoalId) as GoalCount
	FROM Client c
		LEFT JOIN ClientGoal y ON c.ClientId = y.ClientId
        LEFT JOIN Goal g ON y.GoalId = g.GoalId
			GROUP BY c.ClientId
            ORDER BY GoalCount;

-- Activity 12 - Select exercise name unit name and min max of exinstancevalue for al excercises with a configured value - why 62 rows??
SELECT e.Name as ExerciseName, u.Name as UnitName, MIN(v.value) as MinValue, MAX(v.value) as `MaxValue`
	FROM Exercise e
		INNER JOIN ExerciseInstance i ON e.ExerciseId = i.ExerciseId
        INNER JOIN ExerciseInstanceUnitValue v ON i.ExerciseInstanceId = v.ExerciseInstanceId
        INNER JOIN Unit u ON v.UnitId = u.UnitId
			GROUP BY e.Name, u.name
            ORDER BY e.Name, u.Name;
					
				
-- Activity 13 - Select exercise name unit name and min max of exinstancevalue for al excercises with a configured value - add exercise category - why 77 rows??
SELECT c.Name as CategoryName, e.Name as ExerciseName, u.Name as UnitName, MIN(v.value) as MinValue, MAX(v.value) as `MaxValue`
	FROM Exercise e
		INNER JOIN ExerciseInstance i ON e.ExerciseId = i.ExerciseId
        INNER JOIN ExerciseCategory c ON e.ExerciseCategoryId = c.ExerciseCategoryId
        INNER JOIN ExerciseInstanceUnitValue v ON i.ExerciseInstanceId = v.ExerciseInstanceId
        INNER JOIN Unit u ON v.UnitId = u.UnitId
			GROUP BY c.name, e.Name, u.name
            ORDER BY c.Name, e.Name, u.name;
            
-- Activity 14 - Select Min and Max ages for each level
SELECT l.Name as LevelName, MIN(DATEDIFF(now(), c.birthDate) / 365.25) AS MinAge, MAX(DATEDIFF(now(), c.birthDate) / 365.25) AS MaxAge
	FROM Level l
		INNER JOIN Workout y ON l.LevelId = y.LevelId
        INNER JOIN ClientWorkout w ON y.WorkoutId = w.WorkoutId
		INNER JOIN Client c ON w.ClientId = c.ClientId
			GROUP BY l.name;

				
				
			
			