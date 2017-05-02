USE Kreditkartenpruefung
GO
CREATE PROCEDURE insertPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50)
AS
BEGIN
INSERT INTO Person(Name, Vorname, Geburtsdatum)
		VALUES (@Name, @Vorname, convert(date, @Geburtsdatum, 104));
END
GO
