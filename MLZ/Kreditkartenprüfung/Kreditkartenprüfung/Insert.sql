
USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertAll
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum DATE,
@Kartennummer BIGINT, 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode SMALLINT,
@Kartentyp VARCHAR(50)
AS
BEGIN

DECLARE @PersonId BIGINT
DECLARE @KartenTypId INT

IF NOT EXISTS (SELECT * FROM Karte WHERE (Kartennummer = @Kartennummer))
BEGIN
EXEC insertPerson @Name, @Vorname, @Geburtsdatum
EXEC insertCardType @Kartentyp

EXEC CheckPerson @Name, @Vorname, @Geburtsdatum, @PersonId OUTPUT
EXEC CheckCardType @Kartentyp, @KartenTypId OUTPUT

EXEC insertCard @PersonId, @KartentypId, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode
END
ELSE
BEGIN
print N'Karte existiert bereits!';
END
END
