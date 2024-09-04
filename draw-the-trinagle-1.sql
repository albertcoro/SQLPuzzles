-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

WITH RECURSIVE Sequencia AS (
    SELECT 20 AS num, CAST('* ' AS CHAR(1024)) AS asterisk
    UNION ALL
    SELECT num - 1, CAST(CONCAT(asterisk, '* ') AS CHAR(1024))
    FROM Sequencia
    WHERE num > 1 -- Adjust the limit here as needed
)
SELECT asterisk
FROM Sequencia
ORDER BY num;