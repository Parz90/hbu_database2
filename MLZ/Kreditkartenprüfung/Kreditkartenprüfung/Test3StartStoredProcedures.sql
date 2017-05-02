USE Kreditkartenpruefung
GO

EXEC insertAll 'Nagulanandan', 'Anushya', '10.02.1990', 9000888870005000, 07, 2018, 123, 'Diner'

SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer, Karte.GueltigkeitMM, Karte.GueltigkeitYYYY, Karte.Sicherheitscode, Karte.Kartensperrung, Karte.Sperrzaehler, Kartentyp.Bezeichnung FROM Karte
INNER JOIN Person
ON Karte.PersonId = Person.Id

INNER JOIN Kartentyp
ON Karte.KartentypId = Kartentyp.Id

USE Kreditkartenpruefung
GO

DECLARE @sperrung BIT
SET @sperrung = 0
EXEC checkAccess 'Nagulanandan', 'Anushya', '10.02.1990', 9000888870005000, 07, 2018, 123, 'Diner', @sperrung OUTPUT

SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer, Karte.GueltigkeitMM, Karte.GueltigkeitYYYY, Karte.Sicherheitscode, Karte.Kartensperrung, Karte.Sperrzaehler, Kartentyp.Bezeichnung FROM Karte
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

SELECT * FROM Log
GO

DELETE Person 
-- WHERE Name != 'Nagulanandan'
GO

DELETE Kartentyp
GO

DELETE Karte
GO

UPDATE Karte SET Sperrzaehler = 0 WHERE Sperrzaehler > 2

UPDATE Kartentyp SET Bezeichnung = 'Diner Card' WHERE Bezeichnung = 'Diner'

DELETE Log