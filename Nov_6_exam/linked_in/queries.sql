-- to get friends of friends
SELECT to_id
FROM 
    (
        SELECT to_id as friends
        from connection
        where from_id=1
    )AS f
JOIN
    connection on 
    f.friends = connection.from_id
    where connection.to_id not in (
        SELECT to_id 
        from connection
        where from_id = 1
    );

-- to find how many followers for each company

SELECT COUNT(*)
FROM 
follow
group by
company_id;

-- to fetch the experience of a specifict user order by date

SELECT description
from 
experience
where profile_id =1
order by start;