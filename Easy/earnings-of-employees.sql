-- https://www.hackerrank.com/challenges/earnings-of-employees/problem

SELECT 
    MAX(total_earnings) AS max_total_earnings,
    COUNT(*) AS num_employees_with_max_earnings
FROM 
    (SELECT 
        salary * months AS total_earnings
     FROM 
        employee) AS earnings
WHERE 
    total_earnings = (SELECT MAX(salary * months) FROM employee);