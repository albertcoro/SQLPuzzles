-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem

Select 
    ROUND(ABS(min(LAT_N)-max(LAT_N))+ABS(min(LONG_W)-max(LONG_W)),4)
from station