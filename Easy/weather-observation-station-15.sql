-- https://www.hackerrank.com/challenges/weather-observation-station-15/problem

SELECT ROUND(LONG_W, 4) from station
where LAT_N=(Select max(LAT_N) from station where LAT_N<137.2345);