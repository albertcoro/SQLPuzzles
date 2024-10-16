-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem

WITH RECURSIVE Find_Root AS (
    SELECT n,p, CAST(' Root' AS CHAR(1024)) as type 
    FROM BST where P is null
    
    UNION ALL
    
    SELECT BST.n,BST.p,
    case 
        when BST.n IN (Select p from BST where p is not null) then 
            CAST(' Inner' AS CHAR(1024))
        else 
            CAST(' Leaf' AS CHAR(1024))
    end as type
    FROM BST
    INNER JOIN Find_Root
    ON FIND_ROOT.n = BST.P 
)

Select n,type
from Find_Root
order by n