-- https://www.hackerrank.com/challenges/challenges/problem

With temp1 as (
    Select hackers.hacker_id, hackers.name, count(challenges.challenge_id) as count_challenge
    from hackers join challenges
    on hackers.hacker_id  = challenges.hacker_id
    group by hackers.hacker_id, hackers.name
), 
temp2 as (
    Select count_challenge, count(hacker_id)
    from temp1
    group by count_challenge
    HAVING COUNT(hacker_id) > 1 
    and count_challenge < (Select max(count_challenge) from temp1)
)

Select temp1.hacker_id, temp1.name, temp1.count_challenge
from temp1
where temp1.count_challenge not in (Select count_challenge from temp2)
order by temp1.count_challenge desc, temp1.hacker_id asc