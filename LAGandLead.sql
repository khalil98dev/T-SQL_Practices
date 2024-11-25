

select StudentID,Name,Subject, 
LAG(Grade,1)    Over (order by Grade desc) as Previsios2Grad
,Grade,
Lead(Grade,1) over (order by Grade desc) As Nex2Grade
from Students 
