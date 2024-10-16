-- https://www.hackerrank.com/challenges/african-cities/problem

Select city.name
from city, country
where city.CountryCode = country.code
and continent = 'Africa'