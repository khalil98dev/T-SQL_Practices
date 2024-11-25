

CREATE PROCEDURE SP_UPDATEPERSON
	@PersonID int, 
	@FirstName Varchar(50) ,
	@LastName Varchar(50), 
	@EMAIL VARCHAR(50)
	as 
		BEGIN 
				UPDATE People 
				set 
					FirstName = @FirstName,
					LastName = @LastName, 
					Email=@EMAIL
				Where PersonID = @PersonID; 

		END


-- Run The Procedure 

EXEC SP_UPDATEPERSON 1,'khalil','bachir','khalil98dev@gmail.com'

select * from People where PersonID = 1; 