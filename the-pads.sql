-- https://www.hackerrank.com/challenges/the-pads/problem

Select 
    CONCAT(name,'(',LEFT(occupation,1),')')
from occupations
order by name;

Select 
    CONCAT('There are a total of ', count(*), ' ' ,lower(occupation), 's.')
from occupations
group by occupation
order by count(*), occupation;