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

-- Creates a Stored Procedures to insert all informtions
CREATE PROCEDURE insertAll
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50),
@Kartennummer VARCHAR(50), 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode SMALLINT,
@Kartentyp VARCHAR(50),
@ValidationMessage VARCHAR(1000) OUTPUT,
@Message VARCHAR(1000) OUTPUT

AS
BEGIN

-- Variables
DECLARE @PersonId BIGINT
DECLARE @KartenTypId INT

SET @ValidationMessage = ''
SET @Message = ''

-- Check and only execute when card is not existing
IF NOT EXISTS (SELECT * FROM Karte WHERE (Kartennummer = @Kartennummer))
BEGIN
-- Execution of Validate Stored Procedures
EXEC validate @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp, @ValidationMessage OUTPUT
	
	-- Run Insertion only if Validation results no error.
	IF (@ValidationMessage = '')
	BEGIN
	EXEC insertPerson @Name, @Vorname, @Geburtsdatum
	EXEC insertCardType @Kartentyp
	EXEC CheckPerson @Name, @Vorname, @Geburtsdatum, @PersonId OUTPUT
	EXEC CheckCardType @Kartentyp, @KartenTypId OUTPUT
	EXEC insertCard @PersonId, @KartentypId, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode
	SET @Message = 'Alle Angaben richtig. Karte erfolgreich erfasst!!!'
	INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
		VALUES	(convert(datetime,GETDATE(),113), 'Test', @Message, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
	END

	-- Log Validation results.
	ELSE
	BEGIN	INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
		VALUES	(convert(datetime,GETDATE(),113), 'Test', @ValidationMessage, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
	END
END

-- Log Card existing already.
ELSE
BEGIN
SET @Message = 'Karte existiert bereits!';
		INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
			VALUES	(convert(datetime,GETDATE(),113), 'Test', @Message, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
END
END
