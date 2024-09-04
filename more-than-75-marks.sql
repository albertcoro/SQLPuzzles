-- https://www.hackerrank.com/challenges/more-than-75-marks/problem

Select Name
from students
where marks > 75
order by right(Name,3), id asc