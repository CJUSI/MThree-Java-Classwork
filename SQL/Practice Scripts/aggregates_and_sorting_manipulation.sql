-- Select database to use --
USE TrackIt;

-- Counting and Selecting manipulation
-- Count TaskIds, 543 values
SELECT COUNT(TaskId)
	FROM Task;

-- Count everything, 543 values
SELECT COUNT(*)
	FROM Task;
    
-- Count from a column including NULL values - NULL not included in count
SELECT COUNT(TaskStatusId)
	FROM Task;
    
-- Aggregating Values of completed tasks
SELECT COUNT(t.TaskId)
	FROM Task t
		INNER JOIN TaskStatus s ON t.TaskStatusId = s.TaskStatusId
			WHERE s.IsResolved = 1;
            
-- Groupby Manipulation and display --
SELECT
    IFNULL(s.Name, '[None]') StatusName,
    IFNULL(s.IsResolved, 0) IsResolved,
    COUNT(t.TaskId) TaskCount
		FROM Task t
			LEFT OUTER JOIN TaskStatus s ON t.TaskStatusId = s.TaskStatusId
				GROUP BY s.Name, s.IsResolved -- IsResolved is now part of the GROUP.
				ORDER BY s.Name;
			
-- List of unique project names
-- Using group by
SELECT
    p.Name ProjectName, p.ProjectId
		FROM Project p
			INNER JOIN Task t ON p.ProjectId = t.ProjectId
				GROUP BY p.Name
				ORDER BY p.Name;

-- Using DISTINCT
SELECT DISTINCT
    p.Name ProjectName, p.ProjectId
		FROM Project p
			INNER JOIN Task t ON p.ProjectId = t.ProjectId
				ORDER BY p.Name;

-- Having Manipulation
-- Wihout having - cant filter results - grabs all records
SELECT
    CONCAT(w.FirstName, ' ', w.LastName) WorkerName,
    SUM(t.EstimatedHours) TotalHours
		FROM Worker w
			INNER JOIN ProjectWorker pw ON w.WorkerId = pw.WorkerId
			INNER JOIN Task t ON pw.WorkerId = t.WorkerId
				AND pw.ProjectId = t.ProjectId
					GROUP BY w.WorkerId, w.FirstName, w.LastName;

-- With HAVING clause on SELECT
SELECT
    CONCAT(w.FirstName, ' ', w.LastName) WorkerName,
    SUM(t.EstimatedHours) TotalHours
		FROM Worker w
			INNER JOIN ProjectWorker pw ON w.WorkerId = pw.WorkerId
			INNER JOIN Task t ON pw.WorkerId = t.WorkerId
				AND pw.ProjectId = t.ProjectId
					GROUP BY w.WorkerId, w.FirstName, w.LastName
						HAVING SUM(t.EstimatedHours) >= 100
							ORDER BY SUM(t.EstimatedHours) DESC;

-- The key words in a SELECT statement are evaluated in the following order:
-- FROM: Determine where to start
-- JOIN ON: Link other tables and formalize row relationships
-- WHERE: Filter table rows
-- GROUP BY: Partition the data and calculate aggregates
-- HAVING: Filter by aggregate
-- SELECT: Decide what is part of the final result
-- DISTINCT: Remove duplicates from the result
-- ORDER BY: Sort the final result
-- LIMIT: Return a subset of the final result
-- This explains why you can't filter aggregates in a WHERE clause but you can ORDER BY aggregate values.

-- OTHER examples
-- Select records that are working on game projects
SELECT
    p.Name ProjectName,
    MIN(t.DueDate) MinTaskDueDate
		FROM Project p
			INNER JOIN Task t ON p.ProjectId = t.ProjectId
				WHERE p.ProjectId LIKE 'game-%'
				AND t.ParentTaskId IS NOT NULL
					GROUP BY p.ProjectId, p.Name
					ORDER BY p.Name;

-- Select overview of each project
SELECT
    p.Name ProjectName,
    MIN(t.DueDate) MinTaskDueDate,
    MAX(t.DueDate) MaxTaskDueDate,
    SUM(t.EstimatedHours) TotalHours,
    AVG(t.EstimatedHours) AverageTaskHours,
    COUNT(t.TaskId) TaskCount
		FROM Project p
			INNER JOIN Task t ON p.ProjectId = t.ProjectId
				WHERE t.ParentTaskId IS NOT NULL
					GROUP BY p.ProjectId, p.Name
						HAVING COUNT(t.TaskId) >= 10
						ORDER BY COUNT(t.TaskId) DESC, p.Name;