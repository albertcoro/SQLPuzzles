-- https://www.hackerrank.com/challenges/weather-observation-station-10/problem

Select distinct city
from station
where lower(right(city,1)) not in ('a','e','i','o','u')