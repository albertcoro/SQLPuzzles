-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem

WITH NumberedRows AS (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn
    FROM 
        STATION
),
TotalCount AS (
    SELECT COUNT(*) AS cnt FROM STATION
)

SELECT ROUND(
    CASE 
        WHEN TotalCount.cnt % 2 = 0 THEN -- Even Count
            (SELECT LAT_N FROM NumberedRows WHERE rn = TotalCount.cnt / 2) +
            (SELECT LAT_N FROM NumberedRows WHERE rn = TotalCount.cnt / 2 + 1) / 2
        ELSE -- Odd Count
            (SELECT LAT_N FROM NumberedRows WHERE rn = (TotalCount.cnt + 1) / 2)
    END
, 4) AS median_lat_n
FROM TotalCount;