CREATE FUNCTION FormatAHVNr
(
	-- Add the parameters for the function here
	@vnr varchar(20)
)
RETURNS varchar(16)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar varchar(16)
	
	SET @vnr = REPLACE(@vnr, '.', '')

	SET @ResultVar = SUBSTRING(@vnr, 1, 3) + '.' 
				   + SUBSTRING(@vnr, 4, 4) + '.'
				   + SUBSTRING(@vnr, 8, 4) + '.'
				   + SUBSTRING(@vnr, 12, 2)

	-- Return the result of the function
	RETURN @ResultVar

END
GO

