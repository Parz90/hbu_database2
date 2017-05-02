USE Kreditkartenpruefung
GO

CREATE PROCEDURE CheckPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50)
AS
BEGIN
SELECT Id FROM Person
WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Geburtsdatum
END
GO
