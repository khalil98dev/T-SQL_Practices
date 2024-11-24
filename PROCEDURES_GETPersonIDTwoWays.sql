

	--Return Person Infrormation Two ways 


	-- 1: 
	CREATE PROCEDURE Sp_GetPersonByID
		@PersonID int
		as 
		BEGIN
			select * from People where PersonID= @PersonID;
		END

	--2 
	CREATE PROCEDURE Sp_GetPersonByID2 
		@PersonID int,
		@FirstName varchar(50) OUTPUT,
		@LastName varchar(50) OUTPUT,
		@Email varchar(50) OUTPUT,
		@IsFound bit OUTPUT
		as 
		BEGIN
			if(Exists(select * from People where PersonID = @PersonID))
				begin
					select 
						@FirstName = FirstName , 
						@LastName = LastName,
						@Email= Email 
					from People where PersonID = @PersonID;
					set @IsFound=1; 
				end
			else 
				begin
					set @IsFound=0;
				end
		END