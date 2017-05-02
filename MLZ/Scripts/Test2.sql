
USE Kreditkartenpruefung

DECLARE @PersonId INT
DECLARE @KartenTypId INT

DECLARE @InputName VARCHAR(50)
DECLARE @InputVorname VARCHAR(50)
DECLARE @InputGebr VARCHAR(50)

DECLARE @InputKartentyp VARCHAR(50)

DECLARE @InputKartennummer INT
DECLARE @InputGueltigkeit VARCHAR(50)
DECLARE @InputSicherheitscode VARCHAR(50)

SET @InputName = 'Nagu'
SET @InputVorname = 'Parz'
SET @InputGebr = '10.02.1990'
SET @InputKartentyp = 'Test'
SET @InputKartennummer = 555
SET @InputGueltigkeit = '10.10.2020'
SET @InputSicherheit = '777'


EXEC insertPerson @InputName, @InputVorname, @InputGebr
EXEC insertCardType @InputKartentyp

EXEC CheckPerson @InputName, @InputVorname, @InputGebr, @PersonId OUTPUT
EXEC CheckCardType @InputKartentyp, @KartenTypId OUTPUT

EXEC insertCard @PersonId, @KartentypId, @InputKartennummer, @InputGueltigkeit, @InputSicherheitscode

SELECT Person.Name, Person.Vorname, Person.Geburtsdatum, Karte.Kartennummer FROM Karte
INNER JOIN Person
ON Karte.PersonId = Person.Id


