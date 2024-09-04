-- https://www.hackerrank.com/challenges/interviews/problem

SELECT
    con.contest_id,
    con.hacker_id,
    con.name,
    SUM(ss.total_submissions) AS Total_submissions,
    SUM(ss.total_accepted_submissions) AS Total_accepted_submissions,
    Sum(vie.total_views) AS Total_views,
    SUM(vie.total_unique_views) AS Total_unique_views
FROM
    Contests AS con
    INNER JOIN
        Colleges AS col ON con.contest_id = col.contest_id
    INNER JOIN
        Challenges AS cha ON col.college_id = cha.college_id
    LEFT JOIN
        (SELECT
            ch.challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM
            Challenges AS ch 
        LEFT JOIN 
            View_Stats AS vs USING(challenge_id)
        GROUP BY
            ch.challenge_id) AS vie ON cha.challenge_id = vie.challenge_id
    LEFT JOIN
        (SELECT
            ch.challenge_id,
            SUM(sus.total_submissions) AS total_submissions,
            SUM(sus.total_accepted_submissions) AS total_accepted_submissions
        FROM
            Challenges AS ch
            LEFT JOIN
            Submission_Stats AS sus USING(challenge_id)
        GROUP BY
            ch.challenge_id) AS ss ON cha.challenge_id = ss.challenge_id
GROUP BY
    con.contest_id,
    con.hacker_id,
    con.name
HAVING
    SUM(ss.total_submissions) <> 0 AND
    SUM(ss.total_accepted_submissions) <> 0 AND
    Sum(vie.total_views) <> 0 AND
    SUM(vie.total_unique_views) <> 0
ORDER BY
    con.contest_id