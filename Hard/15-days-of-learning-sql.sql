-- https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

select 
    uni_hac.submission_date,
    unique_hackers,
    min_hacker_id,
    name 
from (
    select 
        submission_date,
        count(distinct hacker_id) unique_hackers ,
        num2 
    from ( 
        select 
            s.hacker_id,
            s.submission_date,
            sum(s.num) as num2 
        from (
            select 
                distinct hacker_id,
                submission_date,
                1 as num 
            from submissions
        ) s left join (
            select distinct hacker_id,
            submission_date,
            1 as num 
            from submissions
        ) s1 
        on s.hacker_id = s1.hacker_id 
        and s.submission_date >= s1.submission_date 
        group by s.hacker_id,s.submission_date
    )a 
    where 
        cast(substring(submission_date,9,2) as unsigned) = num2 
    group by submission_date,num2
) uni_hac 
 join (
    select 
        a.submission_date as submission_date,
        a.num as num,min(a.hacker_id) as min_hacker_id 
    from (
        select 
            submission_date,
            count(submission_id) as num,
            hacker_id 
        from submissions 
        group by submission_date,hacker_id
    )a join (
        select 
            submission_date,
            max(num) as max_num 
        from (
            select 
                submission_date,
                count(submission_id) as num,
                hacker_id 
            from submissions 
            group by submission_date,hacker_id
        )a 
        group by submission_date
    )b 
    on a.submission_date = b.submission_date 
    and max_num = num 
    group by a.submission_date,a.num
) num_submissions 
on uni_hac.submission_date = num_submissions.submission_date 
join hackers h 
on num_submissions.min_hacker_id = h.hacker_id 
order by uni_hac.submission_date;