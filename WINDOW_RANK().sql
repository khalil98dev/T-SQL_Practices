

select *,
Rank() over (order by Grade desc ) as Rank
from 
Students order by Grade desc 