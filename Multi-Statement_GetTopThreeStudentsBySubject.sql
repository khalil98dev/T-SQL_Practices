CREATE FUNCTION GetTheTopThreeStudentBySybject(@Subject varchar(50)) 
	RETURNS @Result Table  
	(
	studentID int Primary key, 
	Name nvarchar(250), 
	Subject nvarchar(250),
	Grade int 
	)
	as
	BEGIN 
		insert into @Result (studentID,Name,Subject,Grade)
		select top 3 * from GetStudentBySubject(@Subject)   
		order  by Grade desc;

		
	 	RETURN;
	END


	--- Test 
	select * from Students
	insert into Students values 
	(10,'houssem','math',95);
	insert into Students values 
	(11,'Alia','math',92);
	insert into Students values 
	(12,'mazen','math',88);

	select * from GetTheTopThreeStudentBySybject('Math'); 