-- https://www.hackerrank.com/challenges/print-prime-numbers/problem

WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS primes
FROM numbers n
WHERE NOT EXISTS (
    SELECT 1 FROM numbers n2
    WHERE n2.num < n.num AND n.num % n2.num = 0
);