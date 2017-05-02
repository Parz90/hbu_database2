USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum DATE
AS
BEGIN
IF EXISTS(SELECT * FROM Person WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Geburtsdatum)
BEGIN
PRINT ('Dataset already exists!!!')
RETURN(0)
END
ELSE
BEGIN
INSERT INTO Person(Name, Vorname, Geburtsdatum)
		VALUES (@Name, @Vorname, convert(date, @Geburtsdatum, 104));
END
END
GO
