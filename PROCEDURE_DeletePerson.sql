

CREATE PROCEDURE SP_DELETEPERSON
		@PersonID int, 
		@Deleted bit OUTPUT
		as 
			BEGIN
				delete from People where 
				PersonID = @PersonID ;
					if(@@ROWCOUNT > 0) 
						set @Deleted = 1;
					else
						set @Deleted = 0;
			END

--RUN procedure 
	declare @IsDeleted bit ; 

	exec SP_DELETEPERSON 2,@IsDeleted OUTPUT

	if(@IsDeleted=1)
		print 'Person Deleted'
	else 
		print 'Person not deleted'; 


select * from People 
