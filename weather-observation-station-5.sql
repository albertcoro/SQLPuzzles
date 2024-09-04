-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem

(Select city,length(city) from station order by length(city) desc, city asc limit 1)
Union All
(Select city,length(city) from station order by length(city) asc, city asc limit 1)