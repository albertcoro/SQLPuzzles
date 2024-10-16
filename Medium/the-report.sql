-- https://www.hackerrank.com/challenges/the-report/problem

with final_grades as (
    Select name, grade, marks
    from students, grades
    where grades.min_mark<=students.marks and
    grades.max_mark>=students.marks
    order by grade desc
)

SELECT name, grade, marks
FROM (
    SELECT name, grade, marks
    FROM final_grades
    WHERE grade >= 8
    UNION ALL
    SELECT 'NULL' AS name, grade, marks
    FROM final_grades
    WHERE grade < 8
) AS combined_result
ORDER BY grade DESC, name ASC;