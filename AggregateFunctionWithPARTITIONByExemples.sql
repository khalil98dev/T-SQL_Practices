
select 
* , 

SUM(Grade) over (Partition by Subject) as TatalPoints,
AVG(Grade) over (Partition by Subject) as GradeAverage
from Students 
