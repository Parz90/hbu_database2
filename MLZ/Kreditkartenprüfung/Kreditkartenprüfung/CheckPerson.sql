USE Kreditkartenpruefung
GO

CREATE PROCEDURE CheckPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum DATE,
@Id INT OUTPUT
AS
BEGIN
SET @Id = (SELECT Id FROM Person
WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Geburtsdatum)
END
GO


