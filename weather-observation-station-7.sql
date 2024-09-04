-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem

SELECT DISTINCT City
FROM STATION
WHERE LOWER(RIGHT(City, 1)) IN ('a','e','i','o','u')