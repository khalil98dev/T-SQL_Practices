
select * from Accounts;

-- T-sql

DECLARE @Ammount float; 
DECLARE @Sender int; 
DECLARE @Reciver int; 
DECLARE @IsExist bit; 


set @Ammount = 50; 
set @Sender =2; 
set @Reciver =1; 


BEGIN TRANSACTION; 

		begin Try 

			select @IsExist  =  Accounts.AccountID from Accounts where AccountID = @Sender;

			if(@@ROWCOUNT = 0 )
				THROW 50002, 'Sender not found',1;
	--Check if the balance is insuffisant		
			if((Select Balance from Accounts where AccountID = @Sender) < @Ammount) 
						THROW 50001, 'Insifussant funds',2;  

	--Send the an ammount to reciver 
			UPDATE Accounts set Balance= Balance+@Ammount where  AccountID = @Reciver; 
			
			select @IsExist  =  Accounts.AccountID from Accounts where AccountID = @Reciver;
			
	--Check if the reciver exist
			if(@@ROWCOUNT = 0 )
				THROW 50003, 'Reciver not found',3;

				-- Withraw the ammount from the Sender
				UPDATE Accounts set Balance= Balance-@Ammount where  AccountID = @Sender; 


				-- Insert to log file the operation 
				Insert into Transactions values(@Sender,@Reciver,@Ammount,GETDATE()) ;
				
				-- Send Commit 
				Commit ; 

		End Try 

		BEGIN CATCH 
			PRINT 'Error number: '+CAST(ERROR_NUMBER() AS VARCHAR)  +'  '+  ERROR_MESSAGE(); 

			rollback;
			

		END CATCH 


