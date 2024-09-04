-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem

Select distinct city
from station
where lower(left(city,1)) not in ('a','e','i','o','u')
and lower(right(city,1)) not in ('a','e','i','o','u')