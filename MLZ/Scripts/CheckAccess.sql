
USE Kreditkartenpruefung
GO

CREATE PROCEDURE checkAccess
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum DATE,
@Kartennummer INT, 
@Gueltigkeit DATE, 
@Sicherheitscode INT,
@Kartentyp VARCHAR(50)
AS
BEGIN

DECLARE @PersonId INT
DECLARE @KartenTypId INT
DECLARE @NameOK BIT
DECLARE @VornameOK BIT
DECLARE @GebrOK BIT
DECLARE @KartennrOK BIT
DECLARE @GueltigkeitOK BIT
DECLARE @SicherheitscodeOK BIT
DECLARE @KartentypOK BIT

SET @NameOK = 0
SET @VornameOK = 0
SET @GebrOK = 0
SET @KartennrOK = 0
SET @GueltigkeitOK = 0
SET @SicherheitscodeOK = 0
SET @KartentypOK = 0

IF EXISTS (SELECT * FROM Person WHERE (Name = @Name))
BEGIN
INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Kartennummer, Kartentyp)
VALUES	(convert(datetime,GETDATE(),113),0), @SicherheitsCode, @Typ, @Datum, @Vorname, @Nachname, convert(datetime,GETDATE(),113),0);
END
ELSE
BEGIN
print N'Karte existiert bereits!';
END
END
