
USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertAll
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50),
@Kartennummer INT, 
@Gueltigkeit VARCHAR(50), 
@Sicherheitscode INT,
@Kartentyp VARCHAR(50)
AS
BEGIN

DECLARE @PersonId INT
DECLARE @KartenTypId INT

DECLARE @InputName VARCHAR(50)
DECLARE @InputVorname VARCHAR(50)
DECLARE @InputGebr VARCHAR(50)

DECLARE @InputKartentyp VARCHAR(50)

DECLARE @InputKartennummer INT
DECLARE @InputGueltigkeit VARCHAR(50)
DECLARE @InputSicherheitscode VARCHAR(50)

SET @InputName = @Name
SET @InputVorname = @Vorname
SET @InputGebr = @Geburtsdatum
SET @InputKartentyp = @Kartentyp
SET @InputKartennummer = @Kartennummer
SET @InputGueltigkeit = @Gueltigkeit
SET @InputSicherheitscode = @Sicherheitscode

IF NOT EXISTS (SELECT * FROM Karte WHERE (Kartennummer = @InputKartennummer))
BEGIN
EXEC insertPerson @InputName, @InputVorname, @InputGebr
EXEC insertCardType @InputKartentyp

EXEC CheckPerson @InputName, @InputVorname, @InputGebr, @PersonId OUTPUT
EXEC CheckCardType @InputKartentyp, @KartenTypId OUTPUT

EXEC insertCard @PersonId, @KartentypId, @InputKartennummer, @InputGueltigkeit, @InputSicherheitscode
END
ELSE
BEGIN
print N'Karte existiert bereits!';
END
END
