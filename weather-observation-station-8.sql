-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem

Select distinct city
from station
where Lower(Right(city,1)) IN ('a','e','i','o','u')
and Lower(Left(city,1)) IN ('a','e','i','o','u')