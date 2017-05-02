USE Kreditkartenpruefung
GO

CREATE TRIGGER trInsertPerson
ON Person
INSTEAD OF INSERT AS
BEGIN
DECLARE @Name VARCHAR(50);
DECLARE @Vorname VARCHAR(50);
DECLARE @Gebr DATE;


SELECT @Name = Name FROM inserted;
SELECT @Vorname = Vorname FROM inserted;
SELECT @Gebr = Geburtsdatum FROM inserted;

IF EXISTS(SELECT * FROM Person WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Gebr)
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
INSERT INTO Person(Name, Vorname, Geburtsdatum)
SELECT Name, Vorname, Geburtsdatum FROM inserted;
END
END