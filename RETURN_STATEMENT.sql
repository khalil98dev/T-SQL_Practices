

--CREATE A PRODEDURE CHECK IS THE PERSON EXIST OR NOT 

CREATE PROCEDURE SP_ISEXIST
		@PersonID int
		as
			BEGIN 
				if(Exists(select * from People where PersonID = @PersonID)) 
					RETURN 1;
				ELSE 
					RETURN 0; 


			END
			
-- run procedure 
	DECLARE @RESULT int;
		EXEC @RESULT = SP_ISEXIST 3 

		--Test 
		if(@RESULT=1) 
			print'Person exist'
		else 
			print'Person not found'
			 
