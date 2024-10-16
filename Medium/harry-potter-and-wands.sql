-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

Select wands.id, wands_property.age, wands.coins_needed, wands.power
from wands, wands_property
where wands.code = wands_property.code 
and wands_property.is_evil = 0
and wands.coins_needed = (
    SELECT MIN(W1.COINS_NEEDED) 
    FROM WANDS AS W1 
    WHERE W1.POWER = WANDS.POWER 
    AND W1.CODE = WANDS.CODE
)
order by wands.power desc, wands_property.age desc;