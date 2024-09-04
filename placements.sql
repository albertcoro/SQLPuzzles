-- https://www.hackerrank.com/challenges/placements/problem

SELECT 
    s.Name AS Student_Name
FROM 
    Students s
JOIN 
    Friends f ON s.ID = f.ID
JOIN 
    Students f_s ON f.Friend_ID = f_s.ID
JOIN 
    Packages s_p ON s.ID = s_p.ID
JOIN 
    Packages f_p ON f_s.ID = f_p.ID
WHERE 
    f_p.Salary > s_p.Salary
ORDER BY 
    f_p.Salary;