USE Kreditkartenpruefung
GO

EXEC insertAll 'Nagulanandan', 'Janitha', '10.02.1990', 1234, '12.12.2020', 333, 'VISA'

SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer, Karte.Gueltigkeit, Karte.Sicherheitscode, Kartentyp.Bezeichnung FROM Karte
INNER JOIN Person
ON Karte.PersonId = Person.Id

INNER JOIN Kartentyp
ON Karte.KartentypId = Kartentyp.Id

SELECT * FROM Person
GO

SELECT * FROM Kartentyp
GO

SELECT * FROM Karte
GO

DELETE Person 
GO

DELETE Kartentyp
GO

DELETE Karte
GO