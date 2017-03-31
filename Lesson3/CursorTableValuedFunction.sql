ALTER FUNCTION CursorTableValuedFunction
(
	@count as int
)
RETURNS 
	@tableVar TABLE(id INT PRIMARY KEY IDENTITY(1,1),  Vorname varchar(20), VNR varchar(20))
AS
BEGIN
	
	DECLARE @Vorname as varchar(20)
	DECLARE @VNR as varchar(20)

	DECLARE db_cursor CURSOR FOR  
	SELECT TOP(@count) Vorname, VNR
	FROM dbo.Mitglied

	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @Vorname, @VNR

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		   INSERT INTO @tableVar (Vorname, VNR) VALUES(@Vorname, dbo.FormatAHVNr (@VNR))

		   FETCH NEXT FROM db_cursor INTO @Vorname, @VNR  
	END  

	CLOSE db_cursor  
	DEALLOCATE db_cursor 
	
	RETURN 
END
GO