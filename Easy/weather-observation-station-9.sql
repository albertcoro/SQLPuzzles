-- https://www.hackerrank.com/challenges/weather-observation-station-9/problem

Select distinct city
from station
where lower(left(city,1)) not in ('a','e','i','o','u')