-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

WITH NumberedRows AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (ORDER BY x asc) AS row_num
    FROM 
        functions
)

Select f1.x, f1.y
from NumberedRows f1
join NumberedRows f2
on f1.x = f2.y and f2.x = f1.y
where f1.row_num < f2.row_num
order by f1.x asc