-- https://www.hackerrank.com/challenges/weather-observation-station-17/problem

Select round(LONG_W,4)
from station 
where LAT_N=(
    Select min(LAT_N) 
    from station 
    where LAT_N>38.7780
);