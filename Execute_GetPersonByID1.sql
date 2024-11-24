USE [C21_DB1]
GO

DECLARE	@return_value int,
		@PersonID int

SELECT	@PersonID = 1

EXEC	@return_value = [dbo].[SP_GETPERSONBYID]
		@PersonID = @PersonID OUTPUT

SELECT	@PersonID as N'@PersonID'

SELECT	'Return Value' = @return_value

GO
