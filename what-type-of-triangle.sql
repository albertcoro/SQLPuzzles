-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem

Select 
    case
        when (A+B+C-GREATEST(A,B,C) <= GREATEST(A,B,C)) then
            "Not A Triangle"
        else
            case when (A = B and B = C) then
                "Equilateral"
            when (A <> B and B <> C and A <> C) then
                "Scalene"
            else
                "Isosceles"
            end
    end
from triangles;