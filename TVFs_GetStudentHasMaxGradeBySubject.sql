CREATE FUNCTION GetStudentBySubject(@Subject nvarchar(50)) 
returns Table  
as 
	return(
	select * from Students
	where Students.Subject =@Subject 
	);

 
 -- Test Execution Function ; 
 Declare @MaxGrade int ; 
 select  @MaxGrade=  MAX(Grade) from GetStudentBySubject('Math') ; 

SELECT * FROM GetStudentBySubject('Science') 
where Grade = (select MAX(Grade) from GetStudentBySubject('Math'))


CREATE FUNCTION dbo.GetStudentHasMawMarkBySubject(@Subject varchar(50))
RETURNS TABLE 
return 
(
SELECT * FROM GetStudentBySubject(@Subject) 
where Grade = (select MAX(Grade) from GetStudentBySubject(@Subject))
)


select* from Students
select * from GetStudentHasMawMarkBySubject('English'); 

