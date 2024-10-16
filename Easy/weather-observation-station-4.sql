-- https://www.hackerrank.com/challenges/weather-observation-station-4/problem

SELECT 
    (SELECT COUNT(*) FROM station) - 
    (SELECT COUNT(DISTINCT city) FROM station) 
AS city_difference;