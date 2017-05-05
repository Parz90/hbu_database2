-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 1.3
-- 
-- Change log
-- 29/04/2017   Planung und Beispiel Code
-- 02/05/2017   Grob Implementation
-- 05/05/2017   Fertigstellung Kreditkartenpruefung

USE Kreditkartenpruefung
GO

DECLARE @out1 VARCHAR(50)
DECLARE @out2 VARCHAR(50)

SET @out1 = ' '
SET @out2 = ' '

EXEC insertAll 'Nagulanandan', 'Anushya', '12.07.2003', '44441111222233332', 09, 2017, 876, 'Master Card', @out1 OUTPUT, @out2 OUTPUT

SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer, Karte.GueltigkeitMM, Karte.GueltigkeitYYYY, Karte.Sicherheitscode, Karte.Kartensperrung, Karte.Sperrzaehler, Kartentyp.Bezeichnung FROM Karte
INNER JOIN Person
ON Karte.PersonId = Person.Id

INNER JOIN Kartentyp
ON Karte.KartentypId = Kartentyp.Id

SELECT @out1 AS Validation1
SELECT @out2 AS Error1
GO

USE Kreditkartenpruefung
GO

DECLARE @sperrung BIT
DECLARE @sperrzaehler INT
DECLARE @validation1 VARCHAR(1000)
DECLARE @error1 VARCHAR(1000)

SET @sperrung = 0
SET @sperrzaehler = 0
SET @validation1 = ' '
SET @error1 = ' '
EXEC checkAccess 'Nagulanandan', 'Anushya', '10.02.1990', '9000888870005000', 07, 2018, 123, 'Diner Card', @sperrung OUTPUT, @sperrzaehler OUTPUT, @validation1 OUTPUT, @error1 OUTPUT
-- EXEC checkAccess '', '', '', '900088870005000', 0, 0, 0, '', @sperrung OUTPUT, @sperrzaehler OUTPUT, @validation1 OUTPUT, @error1 OUTPUT


SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer, Karte.GueltigkeitMM, Karte.GueltigkeitYYYY, Karte.Sicherheitscode, Karte.Kartensperrung, Karte.Sperrzaehler, Kartentyp.Bezeichnung FROM Karte
INNER JOIN Person
ON Karte.PersonId = Person.Id

INNER JOIN Kartentyp
ON Karte.KartentypId = Kartentyp.Id

SELECT @validation1 AS Validation1
SELECT @error1 AS Error1


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