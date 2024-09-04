-- https://www.hackerrank.com/challenges/asian-population/problem

Select sum(CITY.population)
from CITY
join COUNTRY
on CITY.CountryCode = COUNTRY.Code
where COUNTRY.continent = 'Asia';