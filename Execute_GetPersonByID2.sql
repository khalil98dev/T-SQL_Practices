USE [C21_DB1]
GO

DECLARE	@return_value int,
		@FirstName varchar(50),
		@LastName varchar(50),
		@Email varchar(50),
		@IsFound bit

EXEC	@return_value = [dbo].[Sp_GetPersonByID2]
		@PersonID = 1,
		@FirstName = @FirstName OUTPUT,
		@LastName = @LastName OUTPUT,
		@Email = @Email OUTPUT,
		@IsFound = @IsFound OUTPUT

SELECT	@FirstName as N'@FirstName',
		@LastName as N'@LastName',
		@Email as N'@Email',
		@IsFound as N'@IsFound'

SELECT	'Return Value' = @return_value

GO
