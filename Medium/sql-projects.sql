-- https://www.hackerrank.com/challenges/sql-projects/problem

WITH DateWithLag AS (
    SELECT 
        Start_Date,
        End_Date,
        LAG(End_Date, 1) OVER (ORDER BY End_Date) AS prev_end_date
    FROM 
        Projects
),
ConsecutiveGroups AS (
    SELECT 
        Start_Date,
        End_Date,
        CASE 
            WHEN DATEDIFF(Start_Date, prev_end_date) = 0 THEN 0
            ELSE 1
        END AS is_new_project
    FROM 
        DateWithLag
),
GroupNumbering AS (
    SELECT 
        Start_Date,
        End_Date,
        SUM(is_new_project) OVER (ORDER BY End_Date) AS project_number
    FROM 
        ConsecutiveGroups
),
ProjectsRanges AS (
    SELECT 
        MIN(Start_Date) AS project_start_date,
        MAX(End_Date) AS project_end_date,
        DATEDIFF(MAX(End_Date), MIN(Start_Date)) + 1 AS project_duration
    FROM 
        GroupNumbering
    GROUP BY 
        project_number
)
SELECT 
    project_start_date,
    project_end_date
FROM 
    ProjectsRanges
ORDER BY 
    project_duration ASC,
    project_start_date ASC;